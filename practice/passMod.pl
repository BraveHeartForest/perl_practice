#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# モジュールを宣言
use Digest::MD5 qw(md5_hex);

# 文字列
my $passwd = '1234';


# 暗号
my $crypt = &encrypt($passwd);
print "$crypt\n";

# 照合
if (&decrypt($crypt, $passwd)) {
	print "OK\n";
} else {
	print "NG\n";
}

#-----------------------------------------------------------
#  Digest::MD5 (hex) 暗号化
#-----------------------------------------------------------
sub encrypt {
	my $plain = shift;

	# saltの8文字を16進でアトランダムに生成 
	my @str = ('a' .. 'f', 0 .. 9);
	my $salt; 
	for (1 .. 8) { 
		$salt .= $str[int(rand(@str))]; 
	}

	# MD5変換（hex形式）
	return $salt . md5_hex($salt . $passwd);
}

#-----------------------------------------------------------
#  Digest::MD5 (hex) 照合
#-----------------------------------------------------------
sub decrypt {
	my ($crypt, $plain) = @_;

	# saltは先頭の8文字を抜き出す
	my $salt = substr($crypt, 0, 8);

	# 照合
	return $crypt eq ($salt . md5_hex($salt . $plain)) ? 1 : 0;
}

#----------------------------------------------
# use Digest::MD5 qw(md5 md5_hex md5_base64);

# $digest = md5($data);
# $digest = md5_hex($data);
# $digest = md5_base64($data);
#----------------------------------------------