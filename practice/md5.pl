#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';


# print "MD5 : " .crypt ('hogehoge','$1$hoge'); #表示される。DES方式では？
# print "\n";
# print "DES : " .crypt ('hogehoge','ja'); #表示される
# print "\n\n";

# パスワード
my $passwd = 'abcd';

# salt
my $salt = '$1$12345678$';  #1...8がsalt部分です。
# id:saltを取得、入力passにsaltを付け加えてhashした物が出力pass(DB保存)に一致するかを確認。

# 暗号化
my $crypt = crypt($passwd, $salt);
print "$crypt\n";

print "現環境ではmd5は使えないことが判明。";