#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my @char = ("A","B","C");

push(@char,"D");    #配列の末尾に要素を追加。
print @char; #ABCD
print "\n";

pop(@char); #配列の末尾を削除。
print @char;    #ABC
print "\n";

unshift(@char,"E"); #配列の先頭に要素を追加。
print @char;    #EABC
print "\n";

shift(@char);   #配列の先頭を削除
print @char;    #ABC
print "\n";

@char = reverse(@char); #配列の順序を逆順にします。
print @char;    #CBA
print "\n";

@char = sort(@char);    #文字列としてソート（昇順に並び替え）
print @char;    #ABC
print "\n";

@char = sort {$b cmp $a } @char;    #文字列として逆ソート（降順に並び替え）cmp=compare
print @char;
print "\n";

my @week = qw{Sun Mon Tue Wed Thu Fri Sat};
print @week;
print "\n";

print "@week[1,2]";
print "\n";