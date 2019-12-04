#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# モジュールを宣言
use Digest::SHA1 qw(sha1_hex);

# 文字列
my $passwd = '1234';

# 暗号化
my $crypt = &encrypt($passwd);
print "$passwd\t:\t$crypt\n";

# 照合
if (&decrypt($crypt, $passwd)) {
	print "OK\n";
} else {
	print "NG\n";
}

#-----------------------------------------------------------
#  Digest::SHA-1 (hex) 暗号化
#-----------------------------------------------------------
sub encrypt {
	my $plain = shift;  #詳細不明。文字コードによって実行内容を変更する際の指標？ コメントアウトしても変化は恐らくない。

	# saltの8文字を16進でアトランダムに生成 
	my @str = ('a' .. 'f', 0 .. 9);
	my $salt; 
	for (1 .. 8) { 
        # for(my $i = 1;$i<=8;$i++)と等しい。
		$salt .= $str[int(rand(@str))]; 
    # print int(rand(@str))."\n"; #は0<=x<「配列strの要素数(今回は15)」の乱数（小数点以下切り捨て）
    # $saltは$str{0..15}の文字のどれかをランダムに並べた文字列。
	}

	# MD5変換（hex形式）
	return $salt . sha1_hex($salt . $passwd);
}

#-----------------------------------------------------------
#  Digest::SHA-1 (hex) 照合
#-----------------------------------------------------------
sub decrypt {
	my ($crypt, $plain) = @_;   #第一引数：変換後文字列、第二引数：平パスワード

	# saltは先頭の8文字を抜き出す
	my $salt = substr($crypt, 0, 8);
    #文字列$cryptの位置[0]から[8]文字を取り出す。これがsaltとして使われた物。

	# 照合
	return $crypt eq ($salt . sha1_hex($salt . $plain)) ? 1 : 0;
    # if ($crypt eq $salt.sha1_hex($salt.$plain)) {
    #     #変換後文字列が「ソルト+平パスワード」をsha1で変換したものと等しいならば、
    #     return 1; # 1は偽値ではない⇔真値である。
    # }else{
    #     #等しくないならば、
    #     return 0; # 0は偽値。
    # }
}