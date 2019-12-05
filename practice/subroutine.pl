#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict; 
use warnings; 
use utf8; 
use Data::Dumper; 
binmode STDIN, ':encoding(cp932)'; 
binmode STDOUT, ':encoding(cp932)'; 
binmode STDERR, ':encoding(cp932)'; 

# (1)引数に渡す値
my $num1 = 1; 
my $num2 = 2; 

# (2)サブルーチンの呼び出し
my $total = total($num1, $num2); 

# (3)サブルーチンの定義
sub total {
    my ($num1, $num2) = @_; 

    my $total = $num1 + $num2; 

    return $total; 
}
print $total . "\n"; 

my @nums = (1..10); 
# 渡す側
my $num_total = &sum(@nums); 

# 受け取る側
sub sum{
    my @nums = @_; 
    my $res = 0; 
    # 処理
    for my $val (@nums) {
        $res += $val; 
    }
    return $res; 
}

print $num_total; 
print "\n";

my %examin = ("apple"=>"11","banana"=>"23","chocolate"=>"34"); 
# print %examin->{apple};
# print %examin;  #banana2apple1chocolate3
# print $examin{"apple"}; # 11
# my @keys = keys %examin;    # bananaapplechocolate
print "\n";


# # 渡す側
# my $examin_total = &sum_examin(%examin); 

# # 受け取る側
# sub sum_examin{
#     my %examin = @_;
#     my @keys = keys %examin;
#     my @examin;
#     my $sum = 0;
#     # 処理
#     for my $val (%examin) {
#         # $val = ["banana","apple","chocolate"]の結果になる。
#         $sum += $examin{$val};
#     }
#     return $sum;
# }
# print "\n";
# print $examin_total;

my @array1 = (11,25,95);
my @array2 = (36,41,87);

sub sumsum {
    my ($array1, $array2) = @_;
    my $sum = 0;
    for (my $i = 0; $i <= @$array1-1; $i++) {
        $sum += $array1->[$i] + $array2->[$i];
    }
    return $sum;
}
# no warnings 'redefine';
# sub sumsum {
#     my ($array1, $array2) = @_;
#     my $sum = 0;
#     for (my $i = @$array1-1; $i >= 0; $i--) {
#         $sum += $array1->[$i] + $array2->[$i];
#         # $sum += $array1[$i] + $array2[$i];
#         # $sum += @$array1[$i]+ @$array2[$i];
#         # $sum += $array1->[0];
#     }
#     return $sum;
# }

print &sumsum(\@array1,\@array2);
print "\n";

# 生徒の数学の点数
my %math_scores = ( 
    Aiko => 89,
    Kenta => 100,
    Taro => 34,
);

print "元のハッシュ\n";
print Dumper \%math_scores;
print "\n\n";

# 1: ハッシュスライス
print "1: ハッシュスライス(Aiko と Kenta の値を取得する)\n";
my @math_score_slice = @math_scores{'Aiko', 'Kenta'};
print "\@math_score_slice = (", join(', ', @math_score_slice), ")\n\n";

# 2: ハッシュスライスを左辺値として使う( Aiko と Kenta に値を設定する )
print "2: ハッシュスライスを左辺値として使う(Aiko と Kenta に値を設定する)\n";
@math_scores{'Aiko', 'Kenta'} = (20, 40); 
print Dumper \%math_scores;

@nums = (17, 23, 13,31,101,2,7,37);

print "1:最大値,最小値を求めるサブルーチン\n";
print "(" . join(',', @nums) . " )\n";
print "最大値 :" . max(@nums) . "\n"; 
print "最小値 :" . min(@nums) . "\n"; 

sub max{
    my @nums = @_;

    my $max_num;
    for my $num (@nums) {
        if (!defined $max_num) {
        # $max_numが未定義ならば$numの値を代入する。
        $max_num = $num;
        } else {
            if ($num > $max_num) {
                # 新しい値$numが$max_numよりも大きければ$max_numの値が書き換わる。
                $max_num = $num;
            }
        }
    }
    return $max_num;
}

sub min{
    my $min_num;
    for my $num (@nums) {
        if (!defined $min_num){
        $min_num = $num;
        }
        else {
        if ($num < $min_num){
            $min_num = $num;
        }
        }
    }
    return $min_num;
}

print "1: バブルソ\ートで昇順に並べ替えるサブルーチン\n";
print join(',', @nums) . " (最初の状態)\n";
my @sorted_nums_ascend = bubble_sort_ascend(@nums);
print join(',', @sorted_nums_ascend) . " (最後の状態)\n\n";

print "2: バブルソ\ートで降順に並べ替えるサブルーチン\n";
print join(',', @nums) . " (最初の状態)\n";
my @sorted_nums_descend = bubble_sort_descend(@nums);
print join(',', @sorted_nums_descend) . " (最後の状態)\n";

# バブルソートするサブルーチン。( 昇順 )
sub bubble_sort_ascend{
    my @nums = @_;
    if (@nums < 2) {
        return @nums;
    }

    my $change_cnt = @nums - 1;

    # 要素数nの配列 a があるとすると、 
    # 最初は、n - 1 回の交換をする。
    # a[0] と a[1], a[1] と a[2], .... ,a[n-2] と a[n-1]

    # ２回目は、n - 2 回の交換をする
    # a[0] と a[1], a[1] と a[2], .... ,a[n-3] と a[n-2]

    # 最後は、
    # a[0] と a[1] を交換する。

    # バブルソートでは、交換が一周するたびに、最大値が
    # 確定していきますので、交換が一周するたびに、
    # 交換回数を、１減らします。
    while( $change_cnt > 0 ){
        for my $i (0 .. $change_cnt - 1) {
        # 次の数と比べて自分のほうが大きければ交換、
        # 自分のほうが小さければ何もしない。
        # こうすることで、一番最後の要素が、最大になる。
        if ($nums[$i] > $nums[$i + 1]) {
            ($nums[$i], $nums[$i + 1]) = ($nums[$i + 1], $nums[$i]);
            print join(',', @nums) . " (スナップ)\n";
            }
        }
        $change_cnt--;
    }

    return @nums;
}

# バブルソートするサブルーチン。( 降順 )
sub bubble_sort_descend{
    my @nums = @_;
    if( @nums < 2 ){
        return @nums;
    }

    my $change_cnt = @nums - 1;

    while ($change_cnt > 0) {
        for my $i (0 .. $change_cnt - 1){ 
        if ($nums[$i] < $nums[$i + 1]) {
            ($nums[ $i ], $nums[ $i + 1]) = ($nums[$i + 1], $nums[$i]);
            print join(',', @nums) . " (スナップ)\n"; 
            }
        }
        $change_cnt--;
    }

    return @nums;
}
# サブルーチンを再定義する(モンキーパッチ)
# sub sum { 
#     #...;
#         }
# no warnings 'redefine';   # これを記述することで同一の名称の自作関数に関するエラーメッセージが表示されなくなる。因みに、同一名称の自作関数を作成すると後ろのものが全体に影響を及ぼす。
# sub sum { 
#     #...;
#         }

# no warnings 'redefine';が存在しないと以下のエラーメッセージが表示される。
# Subroutine sum redefined at subroutine.pl line 220.
# Subroutine sum redefined at subroutine.pl line 224.

print "1: 実行している関数の名前を取得する。\n";
func_name();

sub func_name{
    my $this_func_name = (caller 0)[3];
    # caller 関数の引数に 0 を指定すると
    # 自分自身の関数の情報が、取得できる。
    # 4番目( 要素番号は 3)に関数名が、入っている。
    print $this_func_name, "\n";    # main::func_nameと表示される。
    print "\n";
}

print "2: パッケージ名のない関数名を取得する。\n";
func_name_none_package();

sub func_name_none_package{
    my $this_func_name = ( caller 0 )[3];   # この関数の名称を取得
    $this_func_name =~ s/.*:://; # "."は改行を除く全文字、"*"は直前の文字が0以上 ∴ 改行を除く全文字が0以上＋「::」の文字を削除（空白で置換）する。
    print $this_func_name, "\n\n"; 
}

print "3: 関数名取得をサブルーチン化する。\n";
test1();

sub test1{
    print get_func_name() . "\n";
}

sub get_func_name{
    # caller関数の引数に、1 を指定すると
    # 呼び出し元の関数の情報を取得できる。
    my $this_func_name = (caller 1)[3];   # この関数の名称を取得
    $this_func_name =~ s/.*:://; # "."は改行を除く全文字、"*"は直前の文字が0以上 ∴ 改行を除く全文字が0以上＋「::」の文字を削除（空白で置換）する。
    return $this_func_name; 
}
print "\n";

# AUTOLOAD サブルーチン
# ・定義しておくとサブルーチンの名前を発見できなかった場合に呼び出されます。

print "1: AUTOLOAD で、存在しない関数を呼び出す\n";

# どこにも定義していない関数を呼び出すと。
&aaaaiiiii( 1, 2 );

# これが呼ばれます。
sub AUTOLOAD {

    # $AUROLOAD を定義しておくと、呼び出された関数名を取得できます。
    our $AUTOLOAD; 

    # 関数名と引数を受け取れます。
    my (@arg) = @_; 
    print "AUTOLOAD が呼び出されました。\n";
    print "呼び出そうとした関数は、 $AUTOLOAD です。\n";
    print "引数は、" . join(',', @arg) . "です。\n";
    print "現在のパッケージ名は" . __PACKAGE__ . "です\n";
}