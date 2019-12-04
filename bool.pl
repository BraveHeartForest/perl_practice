#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

print"数値は 0 だけが偽(false)\n<br>0 以外は全て真(true)";

print "文字列は空文字('')だけが偽(false)\n<br>空文字以外は全て真(true)\n<br>

ただし文字の'0'は数値の0と同じなので結果的に文字の'0'は偽(false)";
print "Perlでは未定義値を表す「undef」と言う値が用意されています。「undef」も偽(false)となります。";