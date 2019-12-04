#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
###以下の部分は全部まとめて書かないと意味が無い。
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';
####

print "こんにちは\n<br>";
print "図表\n<br>";

print "文字列の結合"."テストです。どこで区切ったか分からないはずです。\n<br>";

print 10;
print "\n<br>";
print 0x3E; #62
print "\n<br>";
print 012;  #10
print "\n<br>";
print 0b11111111;   #255
print "\n<br>";
print 18.725;
print "\n<br>";
print 3E-8; #3e-008
print "\n<br>";
print "8進数や16進数をそのまま表示する際にはsprintfなどの関数を使います。\n<br>";