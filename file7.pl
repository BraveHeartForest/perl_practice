#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
use open ":utf8";
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# 次は「+>」モード(読み書き)です。このモードの場合は読み込みと書き込みの両方が利用できる状態でファイルを開きます。書式は次のどちらかを使用します。

# open(ファイルハンドル, "+> ファイル名");
# open(ファイルハンドル, "+>", "ファイル名");
# 引数を2つ使う場合にはファイル名の前に「+> 」を付けます。引数を3つ使う場合には2番目の引数に「+>」指定し、3番目の引数にファイル名を指定します。

# 「+>」モードの場合は次の通りです。

# ・読み込み、書き込みの両方とも可
# ・ファイルが存在していた場合、「ファイルを開いた時にファイルサイズを0にする」
# ・ファイルが存在していなかった場合、「新規にファイルを作成」
# 指定したファイルが存在していた場合はいったんファイルサイズを0にしてから書き込みを行いますので、上書きでの書き込みということになります。また指定したファイルが存在していなかった場合でもエラーとならず、新規にファイルが作成されます。

# 実際には次のように記述します。

# open(DATAFILE, "+>", "data.txt") or die("error :$!");
# この場合、「data.txt」と言うファイルを読み書き両用で開きます。

open(DATAFILE, "+>", "data10-1.txt") or die("Error:$!");
#既に存在している場合は中身をクリアしてから新規書き込み。

print DATAFILE "加藤 花子\n";
print DATAFILE "東京都新宿区\n";
print DATAFILE "女性";

close(DATAFILE);

open(DATAFILE, "<", "data10-1.txt") or die("Error:$!");

print "追加後:\n";

while(my $line = <DATAFILE>){
  chomp($line);
  print "$line\n<br>";
}

close(DATAFILE);

open(DATAFILE, "+>", "data10-2.txt") or die("Error:$!");
#存在していないので新規作成。
#二回目以降はただ開くだけ。

print DATAFILE "山崎 一郎\n";
print DATAFILE "大阪府吹田市\n";
print DATAFILE "男性";

close(DATAFILE);