#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# パスワード
my $passwd = '1234';
# print "パスワードを入力してください。\n";
# my $passwd = <STDIN>;
# chomp($passwd);

# 種
# print "ソルトを入力してください。\n";
# my $salt = <STDIN>;
# chomp($salt);
# $salt =~ s/\D//g;
# if ($salt eq "") {
#     $salt = "12";
# }

#暗号文字
my $crypt = 'WEd.83H.gealA';


print &encrypt($passwd);
print "\n";

# 照合
if (&decrypt($crypt, $passwd)) {
	print "OK\n";
} else {
	print "NG\n";
}

#-----------------------------------------------------------
#  DES変換
#-----------------------------------------------------------

sub encrypt {
    my $passwd = shift;

    # 種をアトランダムに生成
    my @str = (0 .. 9, 'a' .. 'z', 'A' .. 'Z', '.', '/');
    my $salt = $str[int(rand(@str))] . $str[int(rand(@str))];
    # rand(@str)で生成される乱数の最大値を決定。@strの要素数が最大値です。
    # int()は小数点以下切り捨てで整数部分を返します。

    # 暗号化
    return crypt($passwd, $salt);
}

#-----------------------------------------------------------
#  DES照合
#-----------------------------------------------------------
sub decrypt {
	my ($crypt, $plain) = @_;   #引数の受け取りを行う。

	# salt抽出
	my $salt = substr($crypt, 0, 2);    #位置[0]から[2]文字を削除

	# 判定
	return $crypt eq crypt($plain, $salt) ? 1 : 0;
}