#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
use open ":utf8";
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

open(DATAFILE, "< data4-1.txt") or die("Error:$!");
#[<]はファイルを読み込み専用で開く。

while(my $line = <DATAFILE>){
  chomp($line);
  print "$line\n<br>";
}

close(DATAFILE);

open(DATAFILE, ">> data5-1.txt") or die("Error:$!");
#[>>]は書き込み専用として開く。

print DATAFILE "大阪\n";
print DATAFILE "Osaka\n";

while(my $line = <DATAFILE>){
  #書き込み専用なので読み込みは出来ないはずです。
  chomp($line);
  print "$line\n<br>";
}

close(DATAFILE);