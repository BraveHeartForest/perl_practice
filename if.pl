#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my $seiseki;    #変数の宣言

$seiseki = 75;
print "得点に${seiseki}を代入しました。\n<br>\n<br>";
if ($seiseki > 60){
  print "得点が60より大きいです。合格です。\n<br>";
  print "おめでとう\n<br>\n<br>";
}else{
    print "貴方の点数は60以下です。\n<br>";
    print "残念ながらあなたの冒険はここで終わってしまった。";
}

print "お疲れ様\n<br>\n<br>";

$seiseki = 47;
print "得点に${seiseki}を代入しました。\n<br>\n<br>";
if ($seiseki > 60){
  print "得点が60より大きいです。合格です\n<br>";
  print "おめでとう\n<br>\n<br>";
}else {
    print "貴方の点数は60以下です。\n<br>";
    print "${seiseki}点でした。\n<br>";
}

print "お疲れ様\n<br>\n<br>";

my ($num, $name);

$num = 10;
if ($num == 10){
  print "$num と10は等しい\n<br>\n<br>";
}

$name = "加藤";
if ($name eq "加藤"){   #equalの略
  print "$name と加藤は等しい\n<br>\n<br>";
}

$num = 10;
if ($num != 15){
  print "$num と15は等しくない\n<br>\n<br>";
}

$name = "加藤";
if ($name ne "伊藤"){   #NotEqualの略
  print "$name は伊藤ではありません\n<br>\n<br>";
}

$num = 10;
if ($num > 5){
  print "$num は5よりも大きい\n<br>\n<br>";
}

$name = "abc";
if ($name gt "ABC"){    #Greater-Than sign
  print "$name はABCより大きい\n<br>\n<br>";
}

my $old;

$old = 24;

if ($old >= 20 && $old < 30){
  print "20代です\n<br>";
  print "${old}歳、楽聖です。\n<br>\n<br>";
}

my ($kokugo, $sansu);   #使用する変数の宣言。

$kokugo = 58;
$sansu = 75;

if ($kokugo >= 60 && $sansu >= 60){
  print "合格です\n<br>\n<br>";
}elsif ($kokugo >=60 || $sansu >=60) {
    print "国語:${kokugo}\n<br>算数:${sansu}\n<br>両方60以上を目指しましょう。\n<br>\n<br>";
}else{
    print "両方60未満です。努力しましょう。\n<br>\n<br>";
}

my $seibetu;

$seibetu = "男性";

if (!($seibetu eq "女性")){
  print "女性ではありません\n<br>\n<br>";
}else{
    print "${seibetu}です。";
}


$num = 12;

print "数値 = $num\n<br>";
if ($num >= 20){
  print "20以上です\n<br>";
}elsif ($num >= 10){
  print "10以上20未満です\n<br>";
}else{
  print "10以下です\n<br>";
}


$seiseki = 75;
unless ($seiseki < 60){
    #「$seisekiが60未満でない」ならば、
  print "合格です\n<br>";
  print "おめでとう\n<br>\n<br>";
}

my $kekka;

$seiseki = 75;
$kekka = $seiseki > 60 ? "合格\n<br>\n<br>" : "不合格\n<br>\n<br>";
#$seiseki>60ならば$kekkaに"合格"を代入。そうでないならば不合格を代入。
print $kekka;

my $count;

$count = 5;
print "$count\n<br>";

$count = $count - 10 if $count > 0; #$countが0より大きいならば$count-10を$countに代入。現在の値は5なので5-10＝-5が代入される。
print "$count\n<br>";

$count = $count - 10 if $count > 0; #$count=-5で0未満なので$count-10は実行されない。
print "$count\n<br>";