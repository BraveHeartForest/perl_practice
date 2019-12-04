#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# モジュールを宣言
use Crypt::SaltedHash;
# http://www.kent-web.com/perl/crypt/step08.html#chap8_4
# 組み込み方は上のサイトを参考にすること。

# 文字列
my $passwd = 'password';

# 暗号
my $crypt = &encrypt($passwd);
# $crypt =~ s/{SSHA}//g;
print "$crypt\n";

# 照合
if (Crypt::SaltedHash->validate($crypt, $passwd)) {
	print "OK\n";
} else {
	print "NG\n";
}

#-----------------------------------------------------------
#  Crypt::SaltedHash暗号
#-----------------------------------------------------------
sub encrypt {
	my $plain = shift;

	# オブジェクト定義
	my $csh = Crypt::SaltedHash->new(); #CryptSaltedHash=>CSH
	$csh->add($plain);  #インスタンスに暗号化したい平パスワードを入力。

	# 暗号化
	return $csh->generate;
    #与えられた平パスワードを暗号化。
}