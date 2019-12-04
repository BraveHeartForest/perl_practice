#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
use open ":utf8";
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

open(DATAFILE, "<", "data6-1.txt") or die("Error:$!");
# 「open」関数を使ってファイルを開く際に、どのような目的で利用するのかをモードで指定することが出来ます。例えば読み込み専用でファイルを開いたり、読み書き両方の使用のためにファイルを開いたりすることが出来ます。ここからは各モードを順に試していきます。

# まず最初に「<」モードを試してみます。このモードの場合は読み込み専用でファイルを開きます。書式は次のどちらかを使用します。

# open(ファイルハンドル, "< ファイル名");
# open(ファイルハンドル, "<", "ファイル名");
# 引数を2つ使う場合にはファイル名の前に「< 」を付けます。引数を3つ使う場合には2番目の引数に「<」指定し、3番目の引数にファイル名を指定します。なおモードを省略した場合にはこのモードとなります。

# 「<」モードの場合は次の通りです。

# ・読み込み専用
# ・ファイルが存在していた場合、ファイルを開いた時に「ファイルの内容を変更しない」
# ・ファイルが存在してなかった場合、エラー
# 実際には次のように記述します。

# open(DATAFILE, "<", "data.txt") or die("error :$!");
# この場合、「data.txt」と言うファイルを読み込み専用で開きます。

while(my $line = <DATAFILE>){
  #ファイルポインタは先頭に存在すると推測できる。
  chomp($line);
  print "$line\n<br>";
}

close(DATAFILE);