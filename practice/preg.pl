#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
use open ":utf8";
use File::Copy;
use Encode;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';

chmod(0666,"data.txt","data2.txt","data3.txt"); #data.txt,data2.txt,data3.txtのパーミッションを666に変更する。
# unlink("data2.txt");
# rename("data.txt","data2.txt");

open(FH,"+< data.txt") or die("Error : $!");
flock(FH,1);
while (my $log = <FH>) {
    #$logは次の行をスカラーに読み込み。
    chomp($log);
    # print "$log\n";
    $log =~ s/猫/ねこですよろしくお願いします。/ ;
    print FH "$log\n";
    # print "$log\n";
}
flock(FH,8);
close(FH);
# print "$log\n";

my $old = "data.txt";
my $new = "data2.txt";

copy($old,$new);

print "OK\n";