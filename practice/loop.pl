#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

for (my $i = 0; $i < 10; $i++) {
  print "$i\t";
}
print "\n";
for (my $i = 0; $i < 10; ++$i) {
  print "$i\t";
}
print "\n";
for (my $i = 0; $i <= 10; $i++) {
  print "$i\t";
}
print "\n";
for (my $i = 0; $i < 10; $i+=2) {
  print "$i\t";
}
print "\n";

my $n = shift;  #コマンドラインから引数を取得する。
if ($n == 1) {
    print "1は素数ではありません。\n" and exit;
}
else {
    for my $i (2 .. sqrt $n){
        print "${n}は素数ではありません。\n" and exit unless($n % $i);
    }
    print "${n}は素数です。\n";
}