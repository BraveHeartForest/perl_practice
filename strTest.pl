#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';


my ($str1, $str2, $str3);

$str1 = "こんにちは";
$str2 = $str1."伊藤さん";
$str3 = $str1 x 3;

print "$str1\n<br>";
print "$str2\n<br>";
print "$str3\n<br>";

my ($var1, $var2, $var3,  $var4);

$var1 = "3" + 4;
$var2 = "3".4;
$var3 = "12ab34" * 5;
$var4 = "abc" + 4;

print "\"3\" + 4 = $var1\n<br>";
print "\"3\".4 = $var2\n<br>";
print "\"12ab34\" * 5 = $var3\n<br>";
print "\"abc\" + 4 = $var4\n<br>";