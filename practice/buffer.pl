#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# 書き込み用のファイル( 上書きするので注意 )
my $file = "sample20080811.txt";

open(my $fh, ">", $file)
  or die "Cannot open $file: $!";
    
print $fh "遅延書き込み\n"; # print関数呼び出し
print "ファイルサイズはまだ";
print  -s $file;
print "バイトで書き込まれていません。\n";
sleep 3;

# closeと同時にバッファをファイルに書き出す(遅延書き込み)。
close $fh or die "Cannot close $file"; 

print "この時点で書き込まれました。サイズは";
print  -s $file;
print  "バイトです。\n";
sleep 3;