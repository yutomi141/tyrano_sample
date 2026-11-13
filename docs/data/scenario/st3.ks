*start
[eval exp="f.time = f.time - 25"]
[eval exp="f.THETA_NAME = ['π/4', 'π/3', 'π/2', '2π/3']"]
[eval exp="f.THETA = [Math.PI / 4, Math.PI / 3, Math.PI / 2, 2 * Math.PI / 3]"]
[eval exp="f.answer = Math.floor(Math.random() * 4)"]
[eval exp="f.p0 = (1 + Math.cos(f.THETA[f.answer])) / 2"]
[eval exp="f.zeros = 0"]
[eval exp="f.total = 0"]

[cm]
[bg storage="gate.png" time=300]
降りる駅に着いた。家までは、駅前から最終バスに乗る。[r]
最終バスまで、あと [emb exp="f.time"] 分。[l][r]
出場改札にカードをかざすと、「運賃を精算してください」と表示された。[l][r]
【駅員】[r]
量子線の運賃は、精算機 U の固有位相 θ で決まります（U|1⟩ = e^{iθ}|1⟩）。[l][r]
お客様のカードを制御ビットにして、アダマールテストで θ を測ってください。[r]
0 が出る確率は (1 + cosθ)/2 です。[l][r]
θ を正しく申告すれば出られます。間違えると残高が1減ります。[l]

*loop
[cm]
[font size=24]
降りる駅　出場改札（運賃精算）　　残高 [emb exp="f.fare"]　最終バスまで [emb exp="f.time"] 分[r][r]
θ の候補：π/4　π/3　π/2　2π/3[r]
0 が出る確率：0.854　0.750　0.500　0.250[r][r]
[if exp="f.total == 0"]
  まだ測っていない。[r]
[else]
  0 が出た回数：[emb exp="f.zeros"] / [emb exp="f.total"] 回（[emb exp="Math.round(f.zeros / f.total * 1000) / 10"]%）[r]
[endif]

[glink text="10回測る（1分）" target="*shot10" x=955 y=120 width=200 size=24]
[glink text="100回測る（5分）" target="*shot100" x=955 y=200 width=200 size=24]
[glink text="θ を答える" target="*answer" x=955 y=320 width=200 size=24]
[resetfont]
[s]

*shot10
[eval exp="f.shots = 10"]
[eval exp="f.time = f.time - 1"]
[jump target="*sample"]

*shot100
[eval exp="f.shots = 100"]
[eval exp="f.time = f.time - 5"]

*sample
[iscript]
let zeros = 0;
for (let i = 0; i < f.shots; i++) {
  if (Math.random() < f.p0) {
    zeros = zeros + 1;
  }
}
f.zeros = f.zeros + zeros;
f.total = f.total + f.shots;
[endscript]
[if exp="f.time < 0"]
  [cm]
  【駅員】[r]
  お客様、たいへん精度の高い測定でしたが、最終バスは出ました。[l]
  [jump storage="ending.ks" target="*judge"]
[endif]
[jump target="*loop"]

*answer
[cm]
精算機に申告する θ は？[r]
[glink text="π/4" target="*judge" x=955 y=120 width=200 size=24 exp="f.guess = 0"]
[glink text="π/3" target="*judge" x=955 y=200 width=200 size=24 exp="f.guess = 1"]
[glink text="π/2" target="*judge" x=955 y=280 width=200 size=24 exp="f.guess = 2"]
[glink text="2π/3" target="*judge" x=955 y=360 width=200 size=24 exp="f.guess = 3"]
[glink text="もう少し測る" target="*loop" x=955 y=480 width=200 size=20]
[s]

*judge
[cm]
[if exp="f.guess == f.answer"]
  ピッ。改札が開いた。[l][r]
  【駅員】[r]
  正解です。θ = [emb exp="f.THETA_NAME[f.answer]"] でした。[l][r]
  [if exp="f.answer == 0"]
    T ゲートでしたね。[l][r]
  [endif]
  [if exp="f.total == 0"]
    [eval exp="f.lucky = f.lucky + 1"]
    （1回も測らずに当てた。運が良かっただけだ）[l][r]
  [endif]
  [eval exp="f.clear = 1"]
  [jump storage="ending.ks" target="*judge"]
[endif]

ブーッ。改札が閉まった。[l][r]
【駅員】[r]
θ = [emb exp="f.THETA_NAME[f.guess]"] ではありません。[l][r]
[eval exp="f.fare = f.fare - 1"]
残高 [emb exp="f.fare"] です。測ったデータはそのまま使えます。[l]
[if exp="f.fare <= 0"]
  [jump storage="ending.ks" target="*judge"]
[endif]
[jump target="*loop"]
