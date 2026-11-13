*judge
[cm]
[if exp="f.fare <= 0"]
  [jump target="*end_fare"]
[elsif exp="f.time < 0"]
  [jump target="*end_time"]
[elsif exp="f.lucky >= 1"]
  [jump target="*end_lucky"]
[elsif exp="f.fare == 3"]
  [jump target="*end_perfect"]
[else]
  [jump target="*end_normal"]
[endif]

*end_fare
[bg storage="gate.png" time=500]
残高がなくなった。改札の外に出られない。[l][r]
【駅員】[r]
よろしければ、始発まで駅員室で遷移表を書きませんか。[l][r]
朝までに、H・X・Z・S の表が全部埋まった。[l][r][r]
【 END：残高ゼロ 】[l]
[jump target="*to_title"]

*end_time
[bg storage="night.png" time=500]
改札を出ると、最終バスのテールランプが遠ざかっていくところだった。[l][r]
家まで歩いて40分。測定回数は、増やせば増やすほど良いわけではない。[r]
誤差は 1/√N でしか減らないのに、時間は N に比例して減る。[l][r][r]
【 END：歩いて帰る 】[l]
[jump target="*to_title"]

*end_lucky
[bg storage="home.png" time=500]
なんとか家に着いた。[l][r]
でも、確率で通った改札が [emb exp="f.lucky"] 回あった。[r]
再現性はない。n = 1 で結論を出すな、と自分に言い聞かせる。[l][r][r]
【 END：運ゲー 】[l]
[jump target="*to_title"]

*end_perfect
[bg storage="home.png" time=500]
1回も弾かれずに、3つの改札を抜けた。[l][r]
【駅員】[r]
お見事です。こちら、量子定期券です。[r]
有効期限は、次に測定されるまでです。[l][r][r]
【 END：完全 】[l]
[jump target="*to_title"]

*end_normal
[bg storage="home.png" time=500]
最終バスに間に合って、家に着いた。[l][r]
明日も1限。また矢上の坂を登る。[l][r][r]
【 END：帰宅 】[l]
[jump target="*to_title"]

*to_title
[cm]
【駅員】[r]
なお、アニーリング線とは直通運転しておりません。[l][r]
[glink text="タイトルへ" target="*start" storage="first.ks" x=490 y=460 width=300 size=24]
[s]
