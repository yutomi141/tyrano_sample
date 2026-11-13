*start

[title name="量子改札 ― 終電までに3つの改札"]
[hidemenubutton]
[wait time=200]
[freeimage layer="base"]
[cm]

[eval exp="f.fare = 3"]
[eval exp="f.time = 40"]
[eval exp="f.lucky = 0"]
[eval exp="f.clear = 0"]

[bg storage="night.png" time=500]

【 量子改札 】[r]
― 終電までに3つの改札 ―[r][r]

[glink text="はじめる" target="*intro" x=490 y=420 width=300 size=28]
[s]

*intro
[cm]
22時30分。研究室を出た。[l][r]
今日もデータが合わなかった。明日もたぶん合わない。[l][r]
量子線で乗り換え駅まで行き、もつれ線の終電に乗り継げば帰れる。終電まであと40分。[l][r]
通る改札は3つ。最寄り駅の入場改札、乗り換え駅の連絡改札、降りる駅の出場改札。[l][r]

[cm]
[bg storage="gate.png" time=500]
駅に着くと、改札の様子がおかしい。[l][r]
「本日より量子改札を導入しました」と貼り紙がある。[l][r]

[cm]
【駅員】[r]
お客様のICカードは、本日から量子ビットになっております。[l][r]
改札がカードを測定して、|1⟩ が出れば開きます。|0⟩ なら閉まります。[l][r]
重ね合わせのまま入ると、確率で弾かれます。[l][r]

[cm]
【駅員】[r]
弾かれると、運賃として残高が1減り、駅員室での説明で3分かかります。[l][r]
残高は3。終電まであと40分です。[l][r]
では、ご乗車ありがとうございます。[l][r]

[jump storage="st1.ks" target="*start"]
