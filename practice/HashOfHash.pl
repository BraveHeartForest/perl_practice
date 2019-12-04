#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my $infos = {
    '01:01' => {count => 3, ave_time => 2.1, max_time => 4.6},
    '01:02' => {count => 5, ave_time => 4.1, max_time => 7.4},
    '01:03' => {count => 6, ave_time => 3.5, max_time => 5.7}
};

for my $time (sort keys %$infos) {
    # %$で連想配列に変換してそのキーをkeysで配列として取得して、並べ替えるsort
    print "$time\n";
    # $time は 配列('01:01','01:02','01:03')の各要素。

    # (2) 内側のループ
    for my $name (sort keys %{$infos->{$time}}) {
        # $infos->{$time}は{count => 3, ave_time => 2.1, max_time => 4.6}の部分。
        # それらを%で連想配列に変換してそのキーを配列として取得して並べ替える。
        # $nameは配列(count,ave_time,max_time)の各要素。
        my $value = $infos->{$time}{$name};
        if ($name eq "count") {
            # 内側のループであることが分かり易いように、先頭に\tでタブを追加＋countのときにタブを二回でave_timeとmax_timeと揃うように設定。
            print "\t$name\t\t:\t$value\n";
        }
        else {
            print "\t$name\t:\t$value\n";
        }
    }
}

# 実行結果はタブも含めて以下の通りです。
# 01:01
#         ave_time        :       2.1
#         count           :       3
#         max_time        :       4.6
# 01:02
#         ave_time        :       4.1
#         count           :       5
#         max_time        :       7.4
# 01:03
#         ave_time        :       3.5
#         count           :       6
#         max_time        :       5.7

for my $time (sort keys %$infos) {
    my @rec = (
        $time,
        $infos->{$time}{count},
        $infos->{$time}{ave_time},
        $infos->{$time}{max_time}
    );
    print join("\t", @rec) . "\n";
    #各要素をタブ区切りで連結した文字列＋改行。
}

my $time_log = {};
while (my $line = <>) {
    chomp $line;

    # (1)時刻と応答時間の取得
    my ($time, $res_time) = split(',', $line);
    # split の返り値は、文字列を要素とするリスト。
    # $line = "a,b,c"とかだったらどうなっているのだろう。

    # (2)各時刻のデータを保存するための配列のリファレンス
    $time_log->{$time} ||= {};
    # $time_log->{$time}が未定義ならば連想配列のリファレンスであることを宣言する。
    # 定義済みならば何もしない。結果的に一度だけ実行されるように記述されている。

    # (3)件数の合計
    $time_log->{$time}{count}++;

    # (4)応答時間の合計
    $time_log->{$time}{total_time} += $res_time;

    # (5)最大応答時間
    $time_log->{$time}{max_time} = $res_time
        if   !defined $time_log->{$time}{max_time}
        || $res_time > $time_log->{$time}{max_time};
    # $infos->{$time}{2}が未定義、若しくは$res_timeが現在の$infos->{$time}{2}よりも大きいならば$infos->{$time}{2}に$res_timeを代入する。
    # 結果的に$infos->{$time}{2}には全ての$res_timeの内で最大のものが格納される。
}
# 完成図
# my $time_log = {
#     '01:03' => {
#         'max_time' => 9,
#         'count' => 4,
#         'total_time' => 20
#     },
#     '01:01' => {
#         'max_time' => 3,
#         'count' => 2,
#         'total_time' => 5
#                      },
#     '01:02' => {
#         'max_time' => 5,
#         'count' => 3,
#         'total_time' => 10
#     }
# };

# $line = "a,b,c"とかだったらどうなっているのだろう。に対する実験。
# my ($a,$b) = ("A","B","C");
# print "$a\n";   # A
# print "$b\n";   # B
