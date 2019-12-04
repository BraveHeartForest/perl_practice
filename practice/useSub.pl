#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# 名前,年齢,出身
my $text = << 'EOS';
tora,24,Japan
rika,12,USA
kenta,25,Chinese
EOS

print "1: csv形式の文字列を、配列の配列に変換する。\n";
my $persons = parse($text);
# print $persons;

require Data::Dumper;
print Data::Dumper->Dump([$persons], ['$perlsons']);

sub parse{
    my $text = shift;
    my @lines = split("\n", $text); # $textを'\n'で分割して配列に変換する。

    my $items_list = [];    # %items_list
    for my $line ( @lines ){
        my @items = split(',', $line);  # $lineを','で区切り配列に変換する。
        push @$items_list, [@items];    # @items_listの末尾に[@items]を追加する。
    }

    wantarray ? return @$items_list : $items_list; 
}

my @numbers = (1, 2, 3, 3, 4, 5, 6, 6, 6, 7, 8);
print '配列 : @numbers = (' . join(',', @numbers) . ")\n\n";

# 1:配列に指定した要素が含まれているかどうかを調べる。
# grepを応用します。
my $saerch_number = 3;
if (grep { $_ == $saerch_number } @numbers) {
    # 検索する要素が、見つかったら、if文の中は真になります。
    # grep関数は条件にマッチした要素のみを取り出す。
    # @matched = grep { 条件文 } @array;
    print "1: ${saerch_number}は存在します。\n";
}

# 2:配列から重複を取り除く( 順序は保障されない )
#ハッシュのキーは重複を許さないという性質を持つ。
my %no_duplicate_hash;
for my $number (@numbers) {
    $no_duplicate_hash{$number}++;
}

# ハッシュのキーのリストを取得
my @no_duplicate_numbers = keys %no_duplicate_hash; # %no_duplicate_hashのキーを配列に変換して取得。
print '2: @no_duplicate_numbers = (' . join(',', @no_duplicate_numbers) . ")\n\n";  # @no_duplicate_numbersの各要素を','で繋いで1つの文字列とする。

# 3:配列に含まれる重なる要素の個数を数える(上の続き)
print "3: 要素の個数\n";
for my $key (sort keys %no_duplicate_hash) {
    print "${key}は$no_duplicate_hash{$key}個含まれます。\n";
}

# my $numbers_ref2 = [1, 2, 3, 4];
# print $numbers_ref2->[0]; # 1

# my @name = qw(mike fred kent peter);

# print "@name[1,2]\n"; # 2番目と3番目を書き出す

# @name = qw(mike fred kent peter);

# @name[0,1] = @name[1,0]; # 1番目と2番目を入れ替え
# print "@name\n";

# @name = qw(mike fred kent peter);

# @name[0,1,2] = @name[1,1,1]; # 1～3番目を全て2番目にする
# print "@name\n";

# @name = qw(mike fred kent peter);

# @name[2,3] = qw(joe lee); # 2,3番目を他に置き換える
# print "@name\n";

