#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# パスワード
my $passwd = 'secret';

# 暗号化
print &encrypt($passwd), "\n";

#-----------------------------------------------------------
#  crypt暗号
#-----------------------------------------------------------
sub encrypt {
	my $plain = shift;

	# saltは8文字作成
	my @wd = (0 .. 9, 'a' .. 'z', 'A' .. 'Z', '.', '/');
	my $salt;
	for (1 .. 8) {
		$salt .= $wd[int(rand(@wd))];
	}

	# 最初にMD5方式で実行し、MD5式暗号なら返す。NGだったらDES方式で実行して返す
	return crypt($plain, '$1$' . $salt . '$') =~ /^(\$1\$.+)/
		? $1
		: crypt($plain, $salt);
}

# 暗号化された文字列
my $crypt = 'YwNyzkAW/DVds';

# 判定
if (&decrypt($crypt, $passwd)) {
	print "OK\n";
} else {
	print "NG\n";
}

#-----------------------------------------------------------
#  crypt照合
#-----------------------------------------------------------
sub decrypt {
	my ($crypt, $plain) = @_;

	# saltの書式を判別する
	my $salt = $crypt =~ /^(\$1\$.*\$).+/ ? $1 : substr($crypt, 0, 2);

	# 照合実行
	return crypt($plain, $salt) eq $crypt ? 1 : 0;
}