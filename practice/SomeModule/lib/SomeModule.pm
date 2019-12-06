package SomeModule;
use strict;
use warnings;

# 二つの数を合計する関数
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

# モジュールの最後の行は真の値を返す必要があります。忘れやすいので注意しましょう。
1;