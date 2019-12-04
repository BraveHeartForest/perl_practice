#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
# これまでのfile.plではあった「use open ":utf8";」が今回はありません。
# use open IN  => ":encoding(文字コード)";  入力の文字コードを指定する
# use open OUT => ":encoding(文字コード)";  出力の文字コードを指定する
# use open IO => ":encoding(文字コード)";   入出力の文字コードを指定する。

# また入出力をまとめて指定する場合は次のように記述することも可能です。
# use open IO ":utf8";
# use open IO ":encoding(cp932)";

binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

open(DATAFILE, "<:utf8", "data12-1.txt") or die("Error:$!");
# open(ファイルハンドル名, "モード:文字コード", "ファイル名");

while(my $line = <DATAFILE>){
  chomp($line);
  print "$line\n<br>";
}

close(DATAFILE);

open(DATAFILE, ">:encoding(cp932)", "data12-2.txt") or die("Error:$!");
# 「data12-2.txt」は存在していないファイルですので新規に作成されます。書き込み時の文字コードとして「cp932(Shift_JIS)」を指定していますので、作成された「data12-2.txt」ファイルの文字コードは「cp932」となっています。
#ちゃんと文字化けします。

print DATAFILE "加藤 花子\n";
print DATAFILE "東京都新宿区\n";
print DATAFILE "女性";

close(DATAFILE);