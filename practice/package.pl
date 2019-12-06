#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
# use strict;
# use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';


print __PACKAGE__ . "\n";
package Foo;

print __PACKAGE__ . "\n";

{ # スコープの開始
  our $NUM1 = 1;

  # 部分名で参照できる
  print "パッケージFooの内部\t:\t\$NUM1=$NUM1";
  print "\n";
} # スコープの終了

# 部分名では参照できない
# print "パッケージFooの外部\t:\t\$NUM1=$NUM1" or die("Error:$!");  # strict,warningをコメントアウトすれば表示される。
print "\n";
# 完全修飾名で参照できる
print "\$Foo::NUM1=$Foo::NUM1";
print "\n\n";

package Hoge; # perlでの名前空間の宣言方法
print __PACKAGE__ . "\n";

our $NUM2 = 1; # スコープの外で宣言

{
  local $NUM2 = 2; # パッケージ変数を一時的に変更することが出来ます。

  # 2が出力される
  print "パッケージHogeの内部(local宣言で変更済み):\t\$NUM2=$NUM2";
  print "\n";
}

# この位置では1に戻る
print "パッケージFooの外部\t\t\t :\t\$NUM2=$NUM2";
print "\n";

if (my $num2 = 1) {
  # 参照できる
  print "if文内部\t\$num2=${num2}";
  print "\n";
}

# この位置では参照できない
print "if文外部\t\$num2=${num2}";
print "\n";

print "後置のif\t\$num3=${num3}" if my $num3 = 1;
print "\n";

# 参照することができる
print "後置のifの後\t\$num3=${num3}";
print "\n";