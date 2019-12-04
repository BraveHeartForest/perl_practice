#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict; #厳密にperlの文法をチェックします。例えば、変数の利用前に宣言が必要。
use warnings;   #これを使うと詳細な警告を発します。

print "Content-type: text/plain\n\n";
print "Hello !\n";

print '※1行目はいずれの記述方法でも構いません。

!"c:\xampp7.3\perl\bin\perl.exe"
!c:/xampp7.3/perl/bin/perl.exe
!/xampp7.3/perl/bin/perl';




my $xx = 5;
my $yy = 2;
my $zz = $xx + $yy;
#グローバル変数の前にmyを付けて、その変数を使用することを宣言。
print "The answer of 5 plus 2 equals $zz.\n<br>";

print "This is return\r test.\n<br>";   #復帰
print "This is formfeed\f test.\n<br>"; #↑の記号が表示される。改ページを意味する
print "This is backspace\b test.\n<br>"; #これを付けると"e"が削除された文が表示される。
print "This is alerm\a test.\n<br>";    #警報音
print "This is escape\e test.\n<br>";   #" t"が削除された文が表示される。
print "This is control\cC test.\n<br>"; #This is control test.
print "THIS IS \lLITTLE CHARACTER TEST.\n<br>"; #次の一文字が小文字になる。
print "This is \uupper character test.\n<br>";  #次の一文字が大文字になる。
print "THIS IS \LLITTLE CHARA\ECTER AND \"END\" TEST.\n<br>";   #\L~\Eの間が小文字になる。
print "This is \Uupper character test.\E\n<br>";    #\U~\Eの間が大文字になる。

=pod
画面出力サンプル
2008/01/22
=cut
print "Orange\n<br>";  #Orange
print "Melon\n<br>";   #Melon
print "Lemon\n<br>";   #Lemon