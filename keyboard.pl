#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

print "名前を入力して下さい\n<br>";
my $line = <STDIN>; #キーボード入力された値を代入する。
# 変数 = <ファイルハンドル>
chomp($line);
#キーボードから入力された値には改行が含まれています。それをchomp関数で取り除きます。chompの行をコメントアウトしてみると確認できます。

print "成績を入力して下さい\n<br>";
my $seiseki = <STDIN>;
chomp($seiseki);

print "名前:$line, 成績:$seiseki\n";