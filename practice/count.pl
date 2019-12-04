#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# ファイルcountdataをファイルハンドルCOUNTでオープン
# オープンできないときにはエラーメッセージを表示して強制終了
open (COUNT, "+<countdata") || die "File 'countdata' Open Error : $!";

# ファイルのロック
flock (COUNT,2);

# 変数$counterにファイルハンドルCOUNTから1行読み込み
my $counter = <COUNT>;

# カウントアップ
$counter = $counter + 1;

# ファイルポインタを先頭に戻す
seek (COUNT, 0, 0);

# ファイルハンドルCOUNTに出力（書き込み）
print COUNT $counter;

# ファイルのロック解除
flock (COUNT,8);

# ファイルのクローズ
close (COUNT);

# カウンタの値を表示
print $counter;

=pod
1.ファイルを読み込み、一行目の数値を$counterで取得する。
2.$counterを+1する。
3.一行目に戻る。（一行目を取得した時点で二行目に移動しているのを戻す）
4.ファイルに$counterの数値を書き込む。
5.ファイルを閉じる。
6.$counterの値を表示する。
=cut