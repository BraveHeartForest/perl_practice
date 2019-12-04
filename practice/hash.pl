#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my %fruits = (
    red => "apple",
    yellow=>"banana",
    purple=>"grape"
);

my @file = keys %fruits;   #fruitsの全てのキーを取得。

print "@file\n";    #purple red yellow

@file = values %fruits;
print "@file\n";    #grape apple banana

# my ($key,$val) = each %fruits;
# print "$key : $val\n";  #purple : grape

#どのペアが取り出されるかが不定であるため、大抵while構文を併用します。

while ( my($key,$val) = each %fruits) {
    print "$key : $val\n";
}

delete $fruits{yellow};
print "yellowを削除しました。\n";
while ( my($key,$val) = each %fruits) {
    print "$key : $val\n";
}
print "\n全要素の削除は\%fruit=();として空リストを代入するのでOK。\n";
print "ただし、これでは定義済みではあります。未定義に戻したいならば[undef \%fruit;]が必要。\n\n";

# 年齢データ
my %age = (tom => 21, mike => 19, kent => 25, nancy => 17);

# tomとmikeを更新
@age{ qw(tom mike) } = (22,20);

# データの中身を見る
while ( my ($key, $val) = each %age ) {
	print "$key : $val\n";
}

# 年齢データ
%age = (tom => 21, mike => 19, kent => 25, nancy => 17);

# kentとnancyの年齢を取り出す
my @data = @age{ qw(kent nancy) };

# リストの中身を見る
print "@data\n";

# use Tie::IxHash;    #連想配列の配列は順番通りに並ばないのを是正する。

# # %hashを関連付け
# tie ( my %hash, 'Tie::IxHash' );

# # ハッシュに代入
# %hash = (
# 		Sun => 0,
# 		Mon => 1,
# 		Tue => 2,
# 		Wed => 3,
# 	);

# # 全要素を展開
# while( my ($key, $val) = each %hash ) {
# 	print "$key : $val\n";
# }