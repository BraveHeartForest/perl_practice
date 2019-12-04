#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my @city = ("東京", "大阪", "名古屋");
&dispArrayValue(@city);    #自作関数の呼び出しは&自作関数名
print "\n<br>";

my @rcity = reverse(@city); #reverse関数は配列の要素を逆順に並び替えます。
&dispArrayValue(@rcity);    #自作関数の呼び出し
print "\n<br>";


# サブルーチンは自作関数のこと
# サブルーチン名として記述する名前は変数と同じくアルファベット・数字・アンダーバー("_")が使用できます。ただし先頭に数字は使用できません。
sub dispArrayValue{
  my @array = @_;

  print "配列の要素を出力します\n<br>";
  foreach my $var(@array){
    print "$var\n<br>";
  }
}

&calcAverage(10, 8);
&calcAverage(5, 17);
print "\n<br>";

sub calcAverage{
  my $ave;
  $ave = ($_[0] + $_[1]) / 2;
#   サブルーチンに渡されてきた引数が格納される配列変数 "$_"
  print "$_[0] と $_[1] の平均値は $ave です\n<br>";
}

sub calcSum{
    my $sum;
    for (my $i=0; $i<=$#_; $i++) {
        $sum += $_[$i];
        if ($i==$#_) {
            print "$_[$i]"; #最後は","を付けない
        }else{
            print "$_[$i],";    #最後以外は","で区切る。
        }
    }
    print "の合計は${sum}です。\n<br>";
}

&calcSum(1..10);
print "\n<br>";

&personal("加藤", 25, "東京都");
print "\n<br>";


sub personal{
  my ($name, $old, $address) = @_;  #各変数に名前を付ける。

  print "名前は${name}です\n<br>";
  print "年齢は${old}です\n<br>";
  print "住所は${address}です\n<br>";
}

# 引数が1つの場合の注意点
# 引数が1つだけだった場合には注意が必要です。例えば次のように記述してしまうと予期せぬ結果となります。

# sub personal{
#   my $name = @_;
# }
# 変数「$name」に対して配列である「@_」を格納しています。配列を単独の変数に格納した場合、"配列の要素数"が変数に格納されてことになっていますので、この場合は引数の値が何であっても変数「$name」には引数の数である「1」が格納されます。

# 引数が1つの場合の正しい記述方法は次の通りです。

# sub personal{
#   my $name;
#   ($name) = @_;
# }
# この場合は、要素が1つのリストに対して配列を格納しています。よって変数「$name」には配列の1番目の要素である「$_[0]」の値が格納されます。もちろん下記のように宣言と同時に格納しても構いません。

# sub personal{
#   my ($name) = @_;
# }

my ($sum, $str);

$sum = &calcTwoNum(10, 23);
print "$sum\n<br>";

$sum = &calcTwoNum(32, 14);
print "$sum\n<br>";
print "\n<br>";

sub calcTwoNum{
  my ($num1, $num2) = @_;

  $num1 + $num2;    #これが戻り値になる。最後に行われた計算が戻り値になるのが規定値です。
}

my $msg;

$msg = &hantei(72, 84);
print "$msg\n<br>";

$msg = &hantei(92, 80);
print "$msg\n<br>";

sub hantei{
  my ($kokugo, $suugaku) = @_;
    print "${kokugo},${suugaku}に関して判定します。両方75以上で合格です。\n<br>";
  if ($kokugo < 75){
    return "不合格";
  }

  if ($suugaku < 75){
    return "不合格";
  }

  return "合格";
}