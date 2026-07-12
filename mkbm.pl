#!/usr/bin/env perl
use v5.40;
no warnings 'experimental';
use builtin qw( inf nan );
use feature ':all';
use utf8;
use open qw( :std :encoding(UTF-8) );
use Encode;
use Carp;
use DDP output => 'STDOUT';

use URI::Escape;

sub main($cmd, @argv) {
    open my $fh, '>', 'docs/index.md' or croak "$!";
    say {$fh} <<'EOS';
[煩悩少年📷️](about.md)

| [あ](#a) | [か](#ka) | [さ](#sa) | [た](#ta) | [な](#na) | [は](#ha) | [ま](#ma) | [や](#ya) | [ら](#ra) | [わ](#wa) |
| :-:      | :-:       | :-:       | :-:       | :-:       | :-:       | :-:       | :-:       | :-:       | :-:       |
| [い](#i) | [き](#ki) | [し](#si) | [ち](#ti) | [に](#ni) | [ひ](#hi) | [み](#mi) |           | [り](#ri) |           |
| [う](#u) | [く](#ku) | [す](#su) | [つ](#tu) | [ぬ](#nu) | [ふ](#hu) | [む](#mu) | [ゆ](#yu) | [る](#ru) |           |
| [え](#e) | [け](#ke) | [せ](#se) | [て](#te) | [ね](#ne) | [へ](#he) | [め](#me) |           | [れ](#re) |           |
| [お](#o) | [こ](#ko) | [そ](#so) | [と](#to) | [の](#no) | [ほ](#ho) | [も](#mo) | [よ](#yo) | [ろ](#ro) |           |
EOS

    my @ids;
    while (<DATA>) {
        chomp;
        next if /^# /;
        if (m{^-\s+(\S+)\s+(\S+)}) {
            push @ids, $1;
            next;
        }
        my ($name, $tags) = m{^([^#]+)(.*)};
        $name =~ s/\s+$//;
        my @tags = split " ", $tags;
        my $escaped = join "+OR+", map { uri_escape_utf8($_) } @tags;
        if (@tags >= 2) {
            $escaped = "($escaped)";
        }
        if (@ids) {
            my $id = pop @ids;
            my $spans = join "", map { qq{<span id="$_"></span>} } @ids;
            say {$fh} qq{- $spans<a id="$id" href="https://x.com/search?f=live&q=from%3Ameisou_shounen+$escaped">$name</a>};
            undef @ids;
            next;
        }

        say {$fh} qq{- [$name](https://x.com/search?f=live&q=from%3Ameisou_shounen+$escaped)};
    }

    say {$fh} "";
    say {$fh} "<br>" x 20;

    return 0;
}

sub debug { say @_ if $ENV{DEBUG} }
exit(main($0, @ARGV));

__DATA__
- a あ
# ai*ai                           #アイアイ
アイアイタイガー                #アイアイタイガー #あいてぃが
# AiVER.                          #AiVER #アイヴァー
あいでぃーる!!                  #あいでぃーる
IDOLSTAGE(練習生)               #アイステ
# +idolist                        #idorist #アイドリスト
idrip                           #idrip
# アイビー                        #カタカナアイビー
# あいり〜む                      #あいり〜む
青山Rabness                     #青ラビ
アクアウィステリア              #アクアウィステリア #アクウィス
# AZの理由(あずのりゆう)          #AZの理由
あでぃくと                      #あでぃくと
アポストロフィ                  #アポストロフィ
あまりりす                      #あまりりす
# Amulet A Mute                   #あむあむ
# 雨沢凛(あめさわりん)            #雨沢凛
ARIStoCRAT                      #ARIStoCRAT #アリクラ
アレキサンドライト              #アレキサンドライト
Arcana Charm                    #あるあむ
アルカナビス                    #アルカナビス
# あわこい                        #あわこい
# antares                         #antares
# &One(あんどわん)                #アンドワン
- i い
# 異国のルミナリア                #異国のルミナリア
# 異世界アイドル☆パラレルパレード    #パラパレ
# 1学期の前髪                     #まえがみちゃん
いちごみるく色に染まりたい。    #いちみる
いつかの夜に僕たちが、          #いつかの夜に僕たちが
Innocent Fairy                  #いふしょっと
if only...                      #いふおん
彩りドロップス                  #彩りドロップス
- u う
ウイバナ                        #ウイバナ
うじゅら                        #うじゅら
- e え
えあらびゅー                    #えあらびゅー
エイアイカ                      #エイアイカ
Aim                             #Aim
エウレカ                        #エウレカ
Lって何のLですか?               #Lなん
Ellememe                        #Ellememe
ANGEL CANDY                     #えんでぃー
- o お
推さぬなら推させてみようホトトギス  #推さホト
おさんぽ娘                      #おさんぽ娘
# 乙花ゆい                        #乙花ゆい
- ka か
片沼日奈子(モデル)              #片沼日奈子
かるちべいと                    #かるちべいと
CURTiA                          #CURTiA
Caress Van End                  #カレバン
# CRNT(カレント)                  #CRNT
- ki き
擬人化にゃんた                  #擬人化にゃんた #市ヶ谷凪紗
気まぐれモンスター              #ぐれもん写真 #ぐれもん
キミイロカクテル                #キミカク
キミイロプロジェクト            #キミイロプロジェクト
キミイロユース                  #キミイロユース
キミと青春をもっと              #キミ青
キミとプレリュード              #キミとプレリュード
きみゆにっ!                     #きみゆにっ
キミリセット                    #キミリセット #キミリセ
Cassie Te Light                 #キャシテラ
きゅーんず!                     #きゅーんず
Cutie♡Cute                     #キュティキュ
- ku く
Queen Clrown                    #QueenClrown
クリームソーダ。                #クリソ
Grim Assembler                  #グリマス
Claire♡Dolls                   #くれどる
くれよんちゅ〜どく              #くれちゅー
- ke け
- ko こ
小泉花恋                        #小泉花恋
KOIHAJI                         #KOIHAJI
Cosmo et Cute                   #コスモエキュート
ConnectCall                     #ConnectCall
コノサキモ隣ニ                  #コノサキモ隣ニ
コバルトブルーは白昼夢          #コバルトブルーは白昼夢
Cortile(コルティーレ)           #Cortile
# CONTRAIL ZERO                   #コンゼロ
comma,                          #comma
- sa さ
再生のルクトゥミー              #ルクトゥミー #ルクトゥミ
酒井穂乃香(モデル)              #酒井穂乃香
流石夏恋                        #流石夏恋
THAT's So                       #ざっつそー
札幌CANDYS                      #札幌CANDYS
- si し
SeedS/PISTIL                    #SeedSPISTIL
SEAF                            #SEAF
紫月はう                        #紫月はう
シャルロット                    #シャルロット
Jumping Kiss                    #ジャンキス
Sure                            #Sure
Jewel☆Garden-Sprout!!          #ジュエガスプラ
- su す
菅沼茉祐                        #菅沼茉祐
水鈴遥                          #水鈴遥
ステラリオン                    #ステラリオン
スーパーマカロニサラダ          #スパマカ #スーパーマカロニサラダ
スターチスのラブレター          #スタラブ
スターリットストーリー          #スターリットストーリー
SPICE BOMB                      #すぱぼむ
- se せ
整形アイドルプロジェクト        #わたいず #整形アイドルプロジェクト
青春リグレット                  #青春リグレット
成徳ロマンスOG                  #成徳ロマンスOG
青藍ピリオド                    #藍ピリ
世界で1番シンデレラ             #世界で1番シンデレラ
瀬口こころ                      #瀬口こころ
- so そ
SoRA                            #SoRA
空色の恋(研究生)                #ソラコイ
- ta た
TIGHT                           #TIGHT
たまプリ                        #たまプリ #たまぷり
- ti ち
CHEERFUL                        #CHEERFUL
ちぇガッツ!                     #ちぇガッツ
- tu つ
Tool to                         #Toolto
# ついんそうる                    #ついんそうる
- te て
天泣                            #天泣
天空のシラバス                  #天空のシラバス
天使突抜ニ読ミ                  #ツキヨミ
- to と
トイランド                      #トイランド
東京おとめ太鼓                  #おとめフォト
東京遊泳ギャラクシー            #東京遊泳ギャラクシー
道玄坂69                        #道玄坂69
.Link                           #どっとりんく
DollyPink                       #DollyPink
とわる                          #とわる
- na な
撫子の音返し                    #撫子の音返し #この音
# 七海こなみ                    #七海こなみ
- ni に
日曜日の起死回生                #ニチカイ
にっぽんワチャチャ              #にっぽんワチャチャ
- nu ぬ
- ne ね
NEO EARTH!!                     #ネオアス撮影部
neOen                           #neOen
- no の
no concept                      #noconcept
のーぷらん。                    #のーぷらん
- ha は
ハートの心電図                  #ハト電
PAiDA                           #PAiDA
Hi-Fi GIRLs PROJECT             #HiFiGL
Vipera                          #Vipera
パステルホログラム              #パステルホログラム
花ノぷりんせす                  #花ぷり
HONEY RULE                      #はにるる
パピ(モデル)                    #パピ
パラパレキッズ                  #パラパレキッズ
ハレノチ×ハレーション          #ハレハレ
# 陽乃ほのか(はれのほのか)      #陽乃ほのか
春名ともみ                      #春名ともみ
HALO PALLETE                    #ハロパレ
ぱんぷるぽっぷ                  #ぱんぷるぽっぷ
- hi ひ
ビーバイユー                    #ビーバイユー
Be!But Because                  #BeButBecause
HERO CHARM                      #ひろちゃむ
Beloved                         #びーらぶふぉと
# ピコレボ                        #ピコレボ
Be Jack                         #BeJack
ヒップバーン                    #ヒップバーン
ヒトノユメ                      #ヒトノユメ
# ビビきたッ!!                    #ビビきたッ
ひめもすオーケストラ            #ひめもすオーケストラ #ひめオケ
100℃の世界                     #100度の世界
HIRAETH.TOKYO                   #ヒラエストーキョー #えあらびゅー
HEROINE CIRCUS                  #HEROINECIRCUS
ヒロインの心                    #ヒロインの心
- hu ふ
ふぁにまるキングダム            #ふぁにまるキングダム #ふぁにキン
FU(D)GE                         #ふぁっじ
# FandL                           #FandL
PHiZZ                           #PHiZZ
フィルフェリーチェ              #フルフリ
Fortuness                       #Fortuness
プエラの絶対値                  #プエラの絶対値
ぶっとび! パンデミック          #ぶっパン
フューチャーサイダー            #チャイダー
フラップアップ⤴︎                 #フラップアップ
Planet Merry                    #プラメリ
Blancanie                       #Blancanie
プランクスターズ                #プランクスターズ
プリズムハート                  #プリズムハート
ブルーなままで                  #ブルーなままで
# ブルベア                        #ブルベア撮影部
フレッシュ撮影会                #フレッシュ撮影会
Blossom Garden                  #BlossomGarden
- he へ
別所あみか                      #別所あみか
Bety                            #Bety
Baby inspire                    #ベビスパ
- ho ほ
ぼくはまだしなない              #ぼくしな
ぽけっとファントム              #ぽけっとファントム
星屑ラビリンス                  #星屑ラビリンス
星宮天音                        #星宮天音
bonbon ange                     #bonbonange
- ma ま
My Criminal Lovers’            #MyCriminalLovers
MyφMe(まいふぁいみー)          #まいみー撮影部 #まいみー
MAGICAL SPEC                    #マジスペ
瞬きのネビュラ                  #瞬きのネビュラ #またネ
真夜中のメリーゴーランド        #まよめり
- mi み
Mio Lavy                        #ミオラビ
# 未完成のキャラメル              #未完成のキャラメル #みかめる
Mikoto                          #Mikoto
Misty Syrena                    #MistySyrena
早坂葵(モデル)                  #早坂葵 #水野ことり
ミニスカポリス                  #ミニスカポリス
ミライサガシ                    #ミラサガフォト
みらくる★ふぉーぜ              #みらくるふぉーぜ
Milky Doll                      #MilkyDoll #めるりぼ
milu milu!                      #ミルミル
- mu む
夢幻のプリューム                #む〜ぷり
- me め
May Love Rouge                  #メイラブ
MEMORI                          #MEMORI
メリーミューズ                  #メリーミューズ
MERRYMO                         #MERRYMO
Melty R!bon                     #めるりぼ
- mo も
# MORE\*                          #MOREをもっと広めたい
望月彩乃                        #望月彩乃
MOFUTTO MATE                    #もふっと
MofruRock                       #モフルロック
ももあ(モデル)                  #ももあ
ももいろプロジェクト            #ももいろプロジェクト
- ya や
YUM!-TUK!(やみつき)             #YMTK
- yu ゆ
You/17(ユーセブン)              #ユーセブン #you17
湯上り茶の間                    #湯上り茶の間 #湯上がり茶の間
柚花うか                        #柚花うか
unique imp                      #ユニプ
夢アドCiTRON                    #夢アドシトロン
ゆめみどき                      #ゆめみどき
- yo よ
夜とメルク                      #よるめる
# 代々木女子音楽院                #ヨヨジョ
- ra ら
ЯanaB(らなびー)                #ЯanaB
Lanan                           #Lanan
LOVE IT'S                       #らぶいつ
LOVE IZ DOLL                    #LOVE_IZ_DOLL
# LUNCH KIDS                      #らんちき
- ri り
♮リアスクライブ                 #リアスクライブ
RiKKYY                          #RiKKYY
LIZZ                            #LIZZ
リットクロスxxx                 #リトクロxxx
ripple link                     #ripplelink
Little Echo                     #リトエコ
Reverse Tokyo                   #リバスト
# Licht                           #リヒト
リベルナント                    #リベルナント #おさんぽ娘
Re:Yu                           #リユー
Lily Muse                       #リリミュー
Re:INCARNATION                  #リンカネ
凛としたすずらん                #凛としたすずらん
- ru る
ルクトゥーMe                    #ルクトゥミ
Luminous Fortune                #LuminousFortune
# るるぱにっく!!                  #るるぱにっく #るるぱ
Res♡Chu                        #れすちゅー
LONDON BLUE                     #ロンブル
- re れ
# Layn                            #Layn
LEVEL7                          #LEVEL7
れんてつ                        #れんてつ
- ro ろ
露光時間                        #露光時間 #刹那フォト
- wa わ
wqwq(わくわく)                  #wqwq
わたあめびーすたーず            #わたびー
# 我らが地球ノ青い鳥              #ワレトリ
