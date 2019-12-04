#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my @numbers = (1, 2, 3, 4, 5, 6, 7, 8);
print "配列 : \@numbers = ( " . join(',', @numbers) . " )\n\n";

# 1:配列のリファレンス @の前に \ をつけると、配列のリファレンスになる。
my $numbers_ref1 =  \@numbers ;

# 配列のリファレンスの前に@をつけると元の配列に戻すことができる。
# これを、デリファレンスという。
print "配列 : \@\$numbers_ref1 = (" . join(',', @$numbers_ref1).")\n";

# 2: けれど、普通は上のような書き方はしない。
# 無名配列( [ ] )というものを使って、直接配列のリファレンスを作る。
my $numbers_ref2 = [1, 2, 3, 4]; 
print "配列 : \$numbers_ref2 = [" . join(',', @$numbers_ref2) . "]\n\n";

#3: 配列の要素にアクセスする。( $array_ref->[ 要素番号 ] )
print "\$numbers_ref2->[0] = $numbers_ref2->[0]\n"; # 1
print "\$numbers_ref2->[1] = $numbers_ref2->[1]\n"; # 2

########################################################

@numbers = (1, 2, 3);
print "配列 : \@numbers = (" , join(',', @numbers), ")\n\n";

my $numbers_ref = [1, 2, 3];

# 1. 要素の参照
print "1. 要素の参照\n";
print "\$numbers[0] = ", $numbers[0], "\n"; # 1

# 配列のリファレンス
print "\$numbers_ref->[0] = ", $numbers_ref->[0], "\n"; # 1
print "\n";

# 2. 各要素の処理
print "2. 各要素の処理\n";

# 配列
print "\@numbers = "  ;
for my $number (@numbers) {
  print $number . "," ;
}
print "\n"; # @numbers = 1,2,3,

# 配列のリファレンス( for文に、デリファレンスしてわたす)
print "\@{ \$numbers_ref } = ";
for my $number (@$numbers_ref){
  print $number . ","
}
print "\n\n";   # @{ $numbers_ref } = 1,2,3,

# 3. 関数の使い方
print "3. 関数の使い方\n";

# 配列
push @numbers, 4;   #末尾に4を追加。
@numbers = sort { $b <=> $a } @numbers; # 降順で並べ替え。$a,$bでないといけない。$cはダメ。
print "\@numbers = (" , join(',', @numbers),")\n";

# 配列のリファレンス(デリファレンスして関数に渡す)
push @$numbers_ref, 4;   #末尾に4を追加。

# sort関数は、配列を返すので、無名配列[ ]を使って
# 配列のリファレンスを再作成している。
$numbers_ref = [sort { $b <=> $a } @$numbers_ref]; 
print "\@\$numbers_ref = (" , join(',', @$numbers_ref),")\n\n";

my @nums = (1, 2, 3);

my $nums = \@nums;
#これと同様の効果を持つのは
# my $nums = [1,2,3];

print $nums->[0];
print "\n";

my $ref = [1,2,3];  #リファレンスを作成してから、配列を作成する。
my @ref = @{$ref};  # or @$ref;

print @ref; #123
print "\n";

# 二次元配列の間違った例
my @person1 = ('Ken', 'Japan', 19);
my @person2 = ('Taro', 'USA', 45);

my @persons = (@person1, @person2);

print @persons; # KenJapan19TaroUSA45
# @personsは('Ken', 'Japan', 19, 'Taro', 'USA', 45)という一次元の配列になってしまいます。
print "\n";
@person1 = ('Ken', 'Japan', 19);
@person2 = ('Taro', 'USA', 45);

@persons = (\@person1, \@person2);

print @persons;   # ARRAY(0x34a1438)ARRAY(0x34a13a8)
print "\n";

my $persons = [
    ['Ken','Japan',19],
    ['Taro','USA',45],
];

print @persons; # ARRAY(0x3498b60)
print "\n";

my $name1    = $persons->[0]->[0];
my $country1 = $persons->[0]->[1];
my $age1     = $persons->[0]->[2];

# my $name1    = $persons->[0][0];
# my $country1 = $persons->[0][1];
# my $age1     = $persons->[0][2];

my $name2    = $persons->[1]->[0];
my $country2 = $persons->[1]->[1];
my $age2     = $persons->[1]->[2];

# my $name2    = $persons->[1][0];
# my $country2 = $persons->[1][1];
# my $age2     = $persons->[1][2];

print "$name1\t:\t$country1\t:\t$age1";
print "\n";
print "$name2\t:\t$country2\t:\t$age2";
print "\n";

for my $person (@$persons) {
    for my $column(@$person) {
        print "$column\n";
    }
}
# Perlの二次元配列は実質としては、配列のリファレンスを要素に持つ配列のリファレンスです。ですからループさせる場合はデリファレンスして配列を取り出す必要があります。外側のループでは「@$persons」のように、内側のループでは「@$person」のようにデリファレンスを行う必要があるということです。
#foreachを二回ということ。

for my $person (@$persons) {
    print join(',',@$person)."\n";
}

my $defs = [];
while (my $line = <>) {
    chomp $line;
    # if ($line eq "exit") {
    #     # print @$defs->[0][0];
    #     for my $keys (@$defs) {
    #         for my $key (@$keys) {
    #             print $key;
    #         }
    #     }
    #     last;
    # } # my $line = <STDIN>のときのための記述。
    # <>とするとコマンドプロンプトで perl refHash.pl people.txtを実行するとpeople.txtが開かれる。

    my @def = split('\t', $line);   #「a    b   c」ならば@def=(a,b,c)としてタブ区切りを配列に変換する。
    push @$defs, \@def;   # pushの第一引数は配列∴@$でdefsをデリファレンスします。pushの第二引数は配列のリファレンス∴\@def
}

my $flag =0;
for my $keys (@$defs) {
    for my $key (@$keys) {
        print "${key}";
        $flag++;
        if ($flag % 10 == 0) {
            # 10を法として合同式で判定。
            print "\n";
            # 10毎に "," を付けずに改行する。
        }else {
            print ",";
            # 10を法として合同ではない、ならば "," を付ける。
        }
    }
}

# my $flag =0;
# for my $keys (@$defs) {
#     for my $key (@$keys) {
#         print "${key}";
#         $flag++;
#         if ($flag == 10) {
#             print "\n";
#             $flag = 0;
#         }else{
#             print ",";
#         }
#     }
# }
