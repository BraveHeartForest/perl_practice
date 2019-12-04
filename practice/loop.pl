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
my $primeFlag = 0;
if ($n == 1) {
    print "1は素数ではありません。\n" and last;
} else {
    for my $i (2 .. sqrt $n){
        if ($n % $i == 0) {
            $primeFlag++;   # nをiで割ったときの余りが0の場合に+1する。
        }
    }
    if ($primeFlag > 0) {
        print "${n}は素数ではありません。\n";
    }else{
        print "${n}は素数です。\n";
    }
}

# whileの使いどころさん。
my @animals = ('Cat', 'Dog', 'Mouse');
print @animals."\n";    # 3
while (my $animal = pop @animals) {
    print "$animal\n";
}
print @animals."\n";    # 0