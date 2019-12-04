#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
use open ":utf8";
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';
# 次は「+<」モード(読み書き)です。このモードの場合は読み込みと書き込みの両方が利用できる状態でファイルを開きます。書式は次のどちらかを使用します。

# open(ファイルハンドル, "+< ファイル名");
# open(ファイルハンドル, "+<", "ファイル名");
# 引数を2つ使う場合にはファイル名の前に「+< 」を付けます。引数を3つ使う場合には2番目の引数に「+<」指定し、3番目の引数にファイル名を指定します。

# 「+<」モードの場合は次の通りです。

# ・読み込み、書き込みの両方とも可
# ・ファイルが存在していた場合、ファイルを開いた時に「ファイルの内容を変更しない」
# ・ファイルが存在していなかった場合、「エラー」
# ・ファイルポインタ（読み込みor書き込み位置）は「先頭」
# 書き込みの時には元のファイルの内容を変更しませんが、ファイルポインタは先頭になっていますので書き込みを行うと順に上書きされていきます。また指定したファイルが存在しなかった場合はエラーとなります。

# 実際には次のように記述します。

# open(DATAFILE, "+<", "data.txt") or die("error :$!");
# この場合、「data.txt」と言うファイルを読み書き両用で開きます。

open(DATAFILE, "+<", "data9-1.txt") or die("Error:$!");

print DATAFILE "加藤 花子\n";
#一番最初の行を変更する。

close(DATAFILE);

open(DATAFILE, "+<", "data9-1.txt") or die("Error:$!");

print "変更後:\n<br>";

while(my $line = <DATAFILE>){
  #ファイルポインタが先頭にあるので全文読み込むまで終わらない。
  chomp($line);
  print "$line\n<br>";
}

close(DATAFILE);

open(DATAFILE, "+<", "data9-2.txt") or die("Error:$!");
#data9-2は作成していないので「Error:No such file or directory at file6.pl line 45.」と出れば正常。

print DATAFILE "加藤 花子\n";
print DATAFILE "東京都新宿区\n";
print DATAFILE "女性";

close(DATAFILE);