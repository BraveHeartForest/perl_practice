#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my $count;

$count = 0; #$countに0を格納
while ($count < 2){
    #$countが2未満ならば繰り返す。
  print "countの値は${count}です。\n<br>";
  $count ++;
  #$countに+1する。
}
#出力結果は以下の通りです。
#countの値は0です。
#countの値は1です。

print "以上です\n<br>\n<br>";

$count = 0;
until ($count >= 2){
    #$countが2以上ではない場合に繰り返す。
  print "countの値は${count}です。\n<br>";
  $count ++;
}

print "以上です\n<br>\n<br>";

for (my $i = 0; $i < 5; $i++){
  print "count = $i \n<br>";
}
print "以上です\n<br>\n<br>";

# for文の書式は次のようになっていました。

# for (初期化; 条件式; インクリメント){
#   実行する処理1;
#   実行する処理2;
# }
# 初期化、条件式、インクリメントの3つの制御部分を指定し、どのように繰り返しを行うのかを指定するのですが、これらの制御部分は必要無ければ省略することも出来ます。省略する場合は何も記述しません(制御部分の間のセミコロンは必ず記述します)。

# 例えば条件式に何も書かなかった場合、条件式は常に真(true)となり無限ループとなります。

# my $count;

# for ($count = 0;; $count++){
#   print "count = $count \n<br>";
# }
# このようなプログラムを記述してはいけませんが、for文は無限ループとしておき、for文の中で実行する処理として繰り返しを抜けるような演算子を記述する場合もあります。

# また初期化やインクリメントも必要無い場合は省略することが出来ます。全て省略した場合は例えば次のような記述となります。

# my $count = 0;

# for (;;){
#   print "count = $count \n<br>";
#   $count++
# }
# 制御部分の一部を省略するのは特殊な記述方法ではありますが、まったく使われないわけでもないので覚えておいて下さい。

my @fruit = ("りんご", "メロン", "イチゴ"); #リストを定義します。

foreach my $name (@fruit){
  print "$name\n<br>";
}

print "以上です\n<br>\n<br>";

foreach (@fruit){
  print "$_\n<br>";
  # $_ は変数を省略した場合にデフォルト変数として用意されるものです。
}

print "以上です\n<br>\n<br>";


$count = 0;
while (1){
    #1=true∴ずっとループする。
  print "$count\n<br>";
  $count++;

  if ($count > 5){
      # $countが6以上になった場合、
    last;
    #whileを強制終了する。
    # なおlast演算子によって終了となる繰り返し処理というのは、while文、until文、for文、foreach文の他に裸のブロックが対象となります。if文などは対象外ですので、上記のサンプルでlast演算子が実行された時に終了するのはif文ではなくwhile文となります。
  }
}
print "[終了済み]\n<br>\n<br>";

$count = 0;

while ($count <= 5){
  $count++;

  if ($count == 2){
    next;
  }

  print "$count\n<br>";
  
  #next演算子が実行されるとこの位置に進む
}
print "終了\n<br>\n<br>";
# 実行結果は以下の通りです。
# 1
# 3
# 4
# 5
# 6
# 終了

$count = 0;

while ($count <= 5){
  #redo演算子が実行されるとこの位置に進む

  $count++;

  if ($count == 2){
    redo;
    #最初に戻る∴$count++が実行される。そのあと下に進むので$count==2のときのprintは発生しない。
  }

  print "$count\n<br>";
}
print "終了\n<br>\n<br>";
# 実行結果は以下の通りです。
# 1
# 3
# 4
# 5
# 6
# 終了

CALC: for (my $i = 1; $i < 10; $i++){
    #この$iに関するループ処理をCALCと名付ける。
  for (my $j = 1; $j < 10; $j++){
    my $calc = $i * $j;
    print "$i * $j = $calc\n<br>";

    last CALC if 10 < $calc;    #CALCというループ処理を終了させる。
    # CALCが無ければ、$jに関するループ処理を終了させるだけで終わっていた。
  }
}
print "終了\n<br>\n<br>";
#出力結果は以下の通りです。
# 1 * 1 = 1
# 1 * 2 = 2
# 1 * 3 = 3
# 1 * 4 = 4
# 1 * 5 = 5
# 1 * 6 = 6
# 1 * 7 = 7
# 1 * 8 = 8
# 1 * 9 = 9
# 2 * 1 = 2
# 2 * 2 = 4
# 2 * 3 = 6
# 2 * 4 = 8
# 2 * 5 = 10
# 2 * 6 = 12
# 終了

print "$_\n<br>" foreach @fruit;
#出力結果は以下の通りです。
# りんご
# メロン
# イチゴ
# 