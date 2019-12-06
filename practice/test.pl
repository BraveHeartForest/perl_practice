#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# テスト数を指定する
use Test::More tests => 2;  # 今回は以下の二つだけなので、テスト数は2である。

# # ok 関数で試験が成功したかを確認。この試験は成功する。
# my $num1 = 1;
# ok($num1 == 1);   # OK関数の第一引数は試験が成功する条件を記述します。

# # この試験は失敗する
# my $num2 = 2;
# ok($num2 == 1);

############################################################

# 試験単位でスコープを作成するとmyで宣言したレキシカル変数の衝突が起きない。 my $num1が複数存在していても、それがスコープの外であれば問題ない。
# sumの試験
{
  my $num1 = 1;
  my $num2 = 2;
  
  my $total = sum($num1, $num2);
  
  ok($total == 3, 'sum');
}

# doubleの試験
{
  my $num1 = 1;
  
  my $double = double($num1);
    
  # 失敗!
  ok($double == 2, 'double'); 
}

# 二つの数を合計するサブルーチン
sub sum {
  my ($num1, $num2) = @_;
  return $num1 + $num2;
}

# 数を2倍するサブルーチン
sub double {
  my $num = shift;

  # 2倍しなければならないのに、間違って3倍してしまった!
  return $num * 3
}