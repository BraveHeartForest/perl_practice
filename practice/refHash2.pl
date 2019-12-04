#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';


# ハッシュの作成
# my %person = (name => 'Ken', age => 19);

# ハッシュのリファレンスの作成
# my %person = (name => 'Ken', age => 19);
# my $person = \%person;

# 無名ハッシュのリファレンスの作成
my $person = {name => 'Ken', age => 19};

my $name  = $person->{name};
my $age   = $person->{age};

# my $name  = $person{name};    # Global symbol "%person" requires explicit package name at refHash.pl line 211.
# my $age   = $person{age}; #Global symbol "%person" requires explicit package name at refHash.pl line 212.

print "Name : $name\tAge : $age\n";

# ハッシュは値がコピーされる
my %score1 = (math => 68, english => 90);
my %score2 = %score1;

# ハッシュのリファレンスは値はコピーされない
%score1 = (math => 68, english => 90);
my $score_ref1 = \%score1;
my $score_ref2 = $score_ref1;

my $score_ref = {math => 68, english => 90};

# デリファレンス
my %score = %{$score_ref}; # my %score = %$score_ref;でも可

# デリファレンスして標準関数に渡す
# keys %$hash;
# values %$hash;
# each %$hash;

# ハッシュのリファレンスからハッシュの値の取得
my $score_math = $score_ref->{math};

# ハッシュのリファレンスからハッシュの値を設定
$score_ref->{math} = 67;

# ハッシュの値の取得
$score_math = $score{math};
print "数学の点数は${score_math}です\n";

# ハッシュの値を設定
$score{math} = 67;

my %person1 = (name => 'Ken',  country => 'Japan', age => 19);
my %person2 = (name => 'Taro', country => 'USA',   age => 45);

# my @persons = (\%person1, \%person2);
# もしくは
my $persons = [
    {name => 'Ken',  country => 'Japan', age => 19},
    {name => 'Taro',  country => 'USA', age => 45}
];    #これが一般的


for my $person (@$persons) {
    for my $key (sort keys %$person) {
        my $value = $person->{$key};
        print "$key\t:\t$value\n";
    }
}

for my $person (@$persons) {
    my @rec = (
        $person->{name},
        $person->{country},
        $person->{age}
    );

    print join(',', @rec) . "\n";
}

$persons = [];
while (my $line = <>) {
    # (1) 改行を削除
    chomp $line;

    # (2) カンマ区切りの文字列を配列にする
    my @rec = split(',', $line);

    # (3) ハッシュのリファレンスを作成
    my $person = {};    # {}で「ハッシュの」リファレンスを作成。
    $person->{name}    = $rec[0];
    $person->{country} = $rec[1];
    $person->{age}     = $rec[2];

    # (4) 配列のリファレンスに追加
    push @$persons, $person;
}

# 完成図
# my $persons = [
#     {name => 'Ken',  country => 'Japan', age => '19'},
#     {name => 'Taro',  country => 'USA', age => '45'}
# ];

# 完成図確認用
# my $flag1 = 0;
# for my $keys (@$persons) {
#     for my $key (%$keys) {
#         print "${key}";
#         $flag1++;
#         if ($flag1 % 6 == 0) {
#             print "\n";
#         }
#         elsif ($flag1 % 2 == 0) {
#             print "\t";
#         } else {
#             print " => ";
#         }
#     }
# }

# 時間 => [件数, 平均応答時間, 最大応答時間]
my $infos = {
    '01:01' => [3, 2.1, 4.6],
    '01:02' => [5, 4.1, 7.4],
    '01:03' => [6, 3.5, 5.7]
};

# (1)外側のループ
for my $time (sort keys %$infos) {
    #連想配列に変換して%$、並べ替えてsort、それのキーを配列として取得するkeys。
    print "\n$time\n";

    # (2) 内側のループ
    for my $column (@{$infos->{$time}}) {
        # 配列に変換(@{$infos->{$time}})、$infos->{$time}は配列のリファレンス。
        print "$column\t";
    }
}
print "\n";
for my $time (sort keys %$infos) {
    my @rec = ($time, @{$infos->{$time}});
    print join(',', @rec) . "\n";
}
# 結果
# 01:01,3,2.1,4.6
# 01:02,5,4.1,7.4
# 01:03,6,3.5,5.7