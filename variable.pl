#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my $str = "こんにちは\n<br>";

print $str;
print $str;
print $str;

print "\n<br>".'変数$strの内容を書き換えます。'."\n<br>\n<br>";
$str = "こんばんは\n<br>";

print $str;
print $str;
print $str;
print"\n<br>\n<br>\n<br>";

print '$varは変数。'."\n<br>".'@varは配列'."\n<br>".'%varはハッシュ（連想配列)'."\n<br>";
print '複数の変数にmyを適用するときは次の記述も可能。'."\n<br>".'my ($a, $b, %c);';
print"\n<br>\n<br>\n<br>";

print 'my $変数名;'."\n<br>".'$変数名 = 初期値;';
print"\n<br>\n<br>";
print 'my $変数名=初期値;'."\n<br>";
print "どちらでも同じ。\n<br>";
print"\n<br>\n<br>";

my ($var1, $var2);
$var1 = "Hello\n<br>";
$var2 = $var1;

print $var1;
print $var2;

$var1 = "こんにちは\n<br>";

print $var1;
print $var2;
print"\n<br>\n<br>";

my $name = "加藤";
print "Hello,$name san\n<br>";
print 'Hello,$name san'."\n<br>";
print "Hello,${name}san\n<br>";
print 'Hello,${name}san'."\n<br>";
