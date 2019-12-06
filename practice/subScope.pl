#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# サブルーチンの定義とスコープ
# サブルーチンは、スコープの影響を受けない。

{ 
  sub func {
    return 2;
  }
}

print "1: サブルーチンの定義は、スコープの影響を受けない。\n";
my $ret = func();
print "\$ret は、$ret です。\n";