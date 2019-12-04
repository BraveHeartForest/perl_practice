#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my $infos = {}; #$infosは連想配列のリファレンス？
while (my $line = <>) {
    chomp $line;    #改行を削除

    # (1)時刻と応答時間の取得
    my ($time, $res_time) = split(',', $line);
    # $time,$res_timeはそれぞれ$lineを "," で分割した内容。スカラー値のはず。

    # (2)各時刻のデータを保存するための配列のリファレンス
    $infos->{$time} ||= [];
    # $infos->{$time}が偽の時（undef)に []を設定する。

    # (3)件数の合計
    $infos->{$time}[0]++;

    # (4)応答時間の合計
    $infos->{$time}[1] += $res_time;

    # (5)最大応答時間
    $infos->{$time}[2] = $res_time
        if !defined $infos->{$time}[2] || $res_time > $infos->{$time}[2];
}