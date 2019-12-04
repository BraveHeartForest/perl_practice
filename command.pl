#!"C:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# perl プログラム名 引数1 引数2 ...

# コマンドライン引数に記述された値はプログラムの中で参照することが可能です。コマンドライン引数は特別な配列である「@ARGV」の要素として格納されますので、各要素を取り出すことでコマンドライン引数を参照することが可能です。

my ($kokugo, $sansuu);

if (@ARGV == 2){    #引数が2つ。
  my $kokugo = $ARGV[0];
  my $sansuu = $ARGV[1];

  print "国語=$kokugo, 算数=$sansuu\n<br>";
  if ($kokugo > 75 && $sansuu > 75){
    print "合格です\n<br>";
  }else{
    print "不合格です\n<br>";
  }
}else{
  print "引数を2つ指定して下さい\n<br>";
}