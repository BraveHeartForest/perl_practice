#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# モジュールを宣言
use Crypt::RC4;

# パスワード
my $passwd = '春はあけぼの';

# 秘密鍵
my $key = '清少納言';

# RC4暗号
my $crypt = &encrypt($key, $passwd);
print "秘密鍵:$key\tパスワード:$passwd\t結果:$crypt\n";

# RC4復号
my $plain = &decrypt($key, $crypt);
print "$plain\n";

#-----------------------------------------------------------
#  RC4暗号
#-----------------------------------------------------------
sub encrypt {
	my ($key, $plain) = @_;

	# RC4暗号変換
	my $crypt = RC4($key, $plain);

	# バイナリを16進へ変換
	$crypt =~ s/(.)/unpack('H2', $1)/eg;
	$crypt =~ s/\n/n/g;

	# 出力
	return $crypt;
}

#-----------------------------------------------------------
#  RC4復号
#-----------------------------------------------------------
sub decrypt {
	my ($key, $crypt) = @_;

	# 16進をバイナリへ戻す
	$crypt =~ s/n/\n/g;
	$crypt =~ s/([0-9A-Fa-f]{2})/pack('H2', $1)/eg;

	# RC4暗号変換
	return RC4($key, $crypt);
}

# モジュールを宣言
use MIME::Base64;

# パスワード
$passwd = '明日デート決行';

# 秘密鍵
$key = '極秘';

# RC4暗号
$crypt = encode_base64(RC4($key, $passwd), '');
print "$crypt\n";

# RC4復号
print RC4($key, decode_base64($crypt)), "\n";