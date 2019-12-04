#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my ($var1, $var2, $var3);

($var1, $var2, $var3) = ("月曜", "火曜", "水曜");

print "$var1\n<br>";
print "$var2\n<br>";
print "$var3\n<br>\n<br>";

my ($str1, $str2);
my $name = "伊藤";

($str1, $str2) = ($name, "東京都");

print "$str1\n<br>";
print "$str2\n<br>\n<br>";

my ($num1, $num2);
my $zei = 1.1;

($num1, $num2) = (20 * $zei, 800);

print "$num1\n<br>";
print "$num2\n<br>";

($num1, $num2) = ($num2, $num1);
# まずリストの値が一時保管された後でその保管された値が順に変数に格納されるのであって、変数に格納する過程では格納されるリストの値は変化しません。$num1=$num2と$num2=$num1が同時に行われる。

print "$num1\n<br>";
print "$num2\n<br>\n<br>";

my @seiseki;    #配列の宣言は@で始める。
# プログラミング言語によっては配列を宣言する時にいくつの要素を管理するのかを指定する言語もありますが、Perlの配列では、その配列が管理する要素数は自動的に拡張されたり縮小されたりします。
$seiseki[0] = 80;   #配列の各要素を定義するときは${配列名}[x]を使用する。
$seiseki[1] = 75;
$seiseki[2] = 69;

for (my $i = 0; $i < 3; $i++){
  print "$seiseki[$i]\n<br>";
  if ($i == 2) {
      print "\n<br>";
  }
}

$seiseki[5] = 91;


print "$seiseki[5]\n<br>\n<br>";

# my @seiseki;
# $seiseki[0] = 80;
# $seiseki[1] = 75;
# $seiseki[2] = 65;
# $seiseki[5] = 92;
# この記述自体はエラーではありません。この場合、5番目の要素が用意され数値の「92」が格納されます。ただし要素はインデックスに合わせて先頭から順に用意されていきます。2番目の要素まで使っていた状態の時に5番目の要素を使用すると、自動的に3番目と4番目の要素も用意されます。この自動的に作成された要素は初期化されていませんので要素の値は変数の場合と同じく未定義値「undef」となります。

# 要素に格納された値を取得する場合も変数の場合と基本的に代わりありません。変数の場合が「$変数名」だったのに対して配列の要素の場合は「$配列名[インデックス]」で参照できます。
# Use of uninitialized value within @seiseki in concatenation (.) or string at list.pl line 46.未定義の配列の要素を表示しようとすると、こんな感じのエラー文が吐き出される。

my @name = ("伊藤", "工藤", "山田");    #初期化
$name[3] = "高橋";  #追加
$name[1] = "安藤";  #書き換え

for (my $i = 0; $i < 4; $i++){
    #for文の中ではprivateなので毎回myで$iを宣言をする必要がある。
  print "$name[$i]\n<br>";
  if ($i==3) {
      print "\n<br>";
  }
}
# 出力結果は以下の通りです。
# 伊藤 $name[0]
# 安藤 $name[1]
# 山田 $name[2]
# 高橋 $name[3]

@name = qw/ 伊藤 工藤 山田 /;
# 配列の初期化を行う時に便利な演算子にqw演算子がよく利用されます。qw演算子は一覧の文字列を空白文字を区切りとして分割したリストを返してくれます。書式は次の通りです。

# qw/ 対象となる文字列 /
# qw/ 東京 大阪 名古屋 福岡 / は ('東京', '大阪', '名古屋', '福岡')と等しい。
# qw( 対象となる文字列 )
# qw{ 対象となる文字列 }
# qw[ 対象となる文字列 ]
# qw< 対象となる文字列 >

for (my $i = 0; $i < 3; $i++){
  print "$name[$i]\n<br>";
  if ($i==2) {
      print "\n<br>";
  }
}

my @num = (10..14, 20); #10,11,12,13,14を10..14で表現できる。
my $count = @num;   #$countは@numの要素数。配列を変数に格納することで配列の要素数が変数に格納されます。変数に格納せず@numだけでは要素数は取得できない。

for (my $i = 0; $i < $count; $i++){
  print "$num[$i]\n<br>";
  if ($i==$count-1) {
      print "\n<br>";
  }
}

my @array = ("1月", "2月");

my $length = @array;

print "要素数 $length\n<br>";
print @array;
print "\n<br>\n<br>";

# 配列は複数の要素を持っていますが、最後の要素のインデックスを取得する方法を確認します。具体的には次のように記述します。
# $#配列名

my @str = ("1月", "2月", "6月");

$str[$#str] = "3月";    #配列@strの最後の要素を3月に書き換える。
for (my $i = 0; $i <= $#str; $i++){
  print "$str[$i]\n<br>";
  if ($i==$#str) {
      print "\n<br>";
  }
}

$#str = 1;  #配列の要素数を変更。∴$str[2]は消える。
# 要素数 = 最後のインデックス + 1
for (my $i = 0; $i <= $#str; $i++){
  print "$str[$i]\n<br>";
  if ($i==$#str) {
      print "\n<br>";
  }
}
print "$str[$#str]"."\n<br>\n<br>"; #2月

@name = ("加藤", "山田", "林");
print "登録されているのは@{name}です\n<br>";    #登録されているのは加藤 山田 林です
print '登録されているのは @name です';  #登録されているのは @name です

print "\n<br>";
$" = ",";   #区切り文字をスペースから","に変更する。
# 特別変数「$"」
# 配列が展開される時、デフォルトではスペースで区切られて展開されますが、区切り文字は特別な変数「$"」に格納されている値が使用されます。デフォルトではスペースが格納されていますので、他の区切り文字を使って展開したい場合には変数「$"」に区切り文字を設定して下さい。
print "登録されているのは @name です\n<br>\n<br>";    #登録されているのは 加藤,山田,林 です

@name = ("加藤", "山田", "林");
foreach (@name){
  print "$_\n<br>";
}
# 今回はforeach文の制御変数を省略しデフォルトの変数である「$_」を使用しました。