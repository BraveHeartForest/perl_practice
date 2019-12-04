#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';


my ($src, $dst);

$src = 11;
$dst = $src & 14;
print "$src \& 14 = $dst\n<br>";
print "11と14を二進数で表現し各桁で(1:1):T,(1:0):F,(0:0):F,(0:1):FでT/Fを取得し再び十進数に戻した結果が上。\n<br>";

$src = 10;
$dst = $src | 12;
print "$src | 12 = $dst\n<br>";
print "ORを10と12で焼き直しただけです。\n<br>";

$src = 10;
$dst = $src ^ 12;
print "$src ^ 12 = $dst\n<br>";
print "ビットXORは演算子の左辺と右辺の同じ位置にあるビットを比較して、ビットの値が異なる場合にだけ「1」にします。\n<br>";

$src = 10;
$dst = ~$src;
print "~$src = $dst\n<br>";
print "ビットNOTは演算子の右辺の値の各ビットに対して「1」の場合は「0」に、「0」の場合は「1」にします。\n<br>";