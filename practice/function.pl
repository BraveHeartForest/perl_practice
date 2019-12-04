#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# 基本形 → 当然OK!
&hello();

# 基本形 → これもOK!
&hello;

# 省略形 → & は省略してOK!
hello();

# これはダメ → () がないので、& は必須
# hello;

# サブルーチン
sub hello {
	print "Hello World!\n";
}
=pod
これを用いると
複数行にわたって
コメント扱いされますぞ
=cut

my $str = "Hello, World!";

if ($str =~ m/Hello/) {
    print "True\n";
}else {
    print "False\n";
}

$str =~ s/Hello/Good morning/;
print $str; #Good morning, World!
print "\n";

$str =~ tr/a-zA-Z/A-Za-z/;  #大文字小文字を入れ替える。

print $str; #gOOD MORNING, wORLD!
print "\n";

my @word = split(/, /,"Hello, World!"); #","と空白文字で分割。その結果を@wordに代入する。
for my $n (@word) {    #配列@wordの各要素ごとにループ。
    print "$n\n";   #要素を出力して改行
}

print join (", " , ("Hello", "World!")); # HelloとWorld!を「, 」で結合して表示

# 時間を取得するプログラム
# （秒　分　時　日　月　年　曜日　夏時間調整の有無）の順にリスト形式に取得
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime;

# 年は西暦から1900引いた値なので1900加える
$year = $year + 1900;

# 月は１引いた値なので１加える
$mon = $mon + 1;

# 曜日は０～６の値なので対応する曜日にする（ここでは簡単のため配列を使っています。if文でも可）
my $youbi = ('日','月','火','水','木','金','土')[$wday];

print "Content-type: text/html\n\n";# CGIのお約束

print "$year 年 $mon 月 $mday 日（ $youbi ）$hour 時 $min 分 $sec 秒";