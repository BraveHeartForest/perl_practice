#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

sub total {
    my @nums = @_;  #引数を配列をとして取得
    my $count = @nums;  #引数の個数を取得
    my $sum = 0;    #合計値を格納する変数
    for (my $i=0; $i < $count; $i++) {
        $sum += $nums[$i];
        # +演算子は文字列の結合には使えないのでこれは数値の計算でしか使えない。
    }
    return $sum;
}

my @nums = ("1".."10");

print "合計値は".&total(@nums)."です。\n";

@nums = (3,1,4,1,5,9,2,6,5,3,5,8,9,7,9);

print &total(@nums);
print "\n";
@nums = (1..20);
print total(@nums);
print "\n";
print total();
print "\n";
print total;
print "\n";
print total(10..100);
print "\n";
# my $num ||= 2; # $numが未定義で偽値だったので2を代入。仮にこれを0とすると↓で100が代入される。
# print $num;
# print "\n";
# $num ||=100;    # $numが定義済みで真値のため100は代入しない。
# print $num;
# print "\n";
# my $und //= 7;  # $undが未定義のため7を代入。
# print $und;
# print "\n";
# $und //= 107;   # $undが定義済みのため107は代入しない。
# print $und;

# 戻り値として配列のリファレンスを返す
sub func1 {
  my $nums = [1, 2, 3];

  return $nums;
}

print func1;    #ARRAY(0x35add98)
print "\n";
# 戻り値としてハッシュのリファレンスを返す
sub func2 {
  my $score = {math => 100, english => 90};

  return $score;
}

print func2;    #HASH(0x3422d88)
print "\n";