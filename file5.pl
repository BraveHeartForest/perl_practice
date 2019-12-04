#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
use open ":utf8";
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

#[>>]は[>]と違い、追加で書き込みも行う。

open(DATAFILE, ">>", "data8-1.txt") or die("Error:$!");

print DATAFILE "加藤 花子\n";
print DATAFILE "東京都新宿区\n";
print DATAFILE "女性";

while(my $line = <DATAFILE>){
    #書き込み専用なので読み取りは行われない。
  print "$line\n<br>";
}

close(DATAFILE);

open(DATAFILE, ">>", "data8-2.txt") or die("Error:$!");

print DATAFILE '次は「>>」モード(書き込み)です。このモードの場合は書き込み専用でファイルを開きます。書式は次のどちらかを使用します。

open(ファイルハンドル, ">> ファイル名");
open(ファイルハンドル, ">>", "ファイル名");
引数を2つ使う場合にはファイル名の前に「>> 」を付けます。引数を3つ使う場合には2番目の引数に「>>」指定し、3番目の引数にファイル名を指定します。

「>>」モードの場合は次の通りです。

・書き込み専用
・ファイルが存在していた場合、ファイルを開いた時にファイルの内容を変更しない
・ファイルが存在してなかった場合、新規にファイルを作成
指定したファイルが存在していた場合はファイルの内容を変更せずにファイルの最後に書き込みを行いますので、追加書き込みということになります。また指定したファイルが存在していなかった場合でもエラーとならず、新規にファイルが作成されます。

実際には次のように記述します。

open(DATAFILE, ">>", "data.txt") or die("error :$!");
この場合、「data.txt」と言うファイルを書き込み専用で開きます。';

close(DATAFILE);