#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# 対象文字
# my $passwd = 'this is a pen.';
print "変換する文字列(半角英数字)を入力してください。\n";
my $passwd = <STDIN>;
chomp($passwd); #改行文字を除外。
print "\n${passwd}を変換します。\n\n";

# シフト数 (1 ～ 25 まで）
print "シフト数(1 ～ 25 まで）を入力してください。\n";
# 引数の正当性
my $shift = <STDIN>;
chomp($shift);
$shift =~ s/\D//g;  #数字以外を全削除。
if ($shift eq "") {
    #数字が全く入っていない場合はこの処理をする。
    die("シフト数には半角数字を入力してください。\n");
}
if ($shift > 25 or $shift < 1) {
    die("シフト数は1 ～ 25までで入力してください。\n");
}

# 暗号
my $crypt = &encrypt($passwd, $shift);
print "\n$crypt\n";

# 復号
print &decrypt($crypt, $shift), "\n";

#-----------------------------------------------------------
#  シーザー暗号
#-----------------------------------------------------------
sub encrypt {
	my ($wd, $shift) = @_;  #サブルーチンで複数の引数を受け取る。

	# 対象文字
	my @wd = ('a' .. 'z');

	# 変換テーブル作成
	my %wd;
	for (0 .. $#wd) {   # 0から「@wdの個数から1を引いた数値＝25」まで繰り返す。
    # 配列[0..$#wd]に対して$_は各要素が順番に代入されていく。
		# 添字を定義
		my $key = $_ <= $#wd - $shift ? $_ + $shift : $_ - $#wd + $shift - 1;
        # 書き換えると以下の通りです。
        # if ($_ <= $#wd - $shift) {
        #     $key = $_ + $shift;
        # }else{
        #     $key = $_ - $#wd + $shift -1;
        # }
        # 例えば $shift=10 , $_=10 ならば 10 < 25-10 =15 ∴ $key = 10+10 =20 となる。
        # $_=20 ならば 20 > 25-10 = 15 ∴ $key = 20-25+10-1 = 4 となる。一意に定まる（証明は以下の通り）。

        # $_ + $shift if $_ <= 25-$shift;
        # $_ + $shift -26 if $_ > 25-$shift;
        # $_+$shift not equal $_+$shift-26.

		# 連想配列生成
		$wd{$wd[$_]} = $wd[$key];
        # $wd{$wd[$_]} = $wd[$key];は
        # %wd = ($wd[$_] => $wd[$key]);と書き換えられる。
        # [添え字を定義]での例を用いる($shift=10)と$wd[10]=>$wd[20],...,$wd[20]=>$wd[4]と対応する文字が決定すると思われる。
	}

	# 変換テーブルにより暗号化
	my $ret;
	for ( split(//,$wd) ) { #split(//,$wd)は文字列$wdを一文字ずつ分割する。
		# 定義済は変換
		if (defined($wd{$_})) {
            # $wd{$_}が定義済みならばtrue、未定義ならばfalse
			$ret .= $wd{$_};

		# 未定義はそのまま
		} else {
			$ret .= $_;
		}
	}
	return $ret;
}

#-----------------------------------------------------------
#  シーザー復号
#-----------------------------------------------------------
sub decrypt {
	my ($crypt, $shift) = @_;

	# 対象文字
	my @wd = ('a' .. 'z');

	# 変換テーブル作成
	my %wd;
	for (0 .. $#wd) {
		# 添字を定義
		my $key = $_ <= $#wd + $shift ? $_ - $shift : $_ + $#wd - $shift + 1;
        # 書き換えると以下の通りです。暗号化の部分と符号が逆になっています。
        # if ($_ <= $#wd + $shift) {
        #     $key = $_ - $shift;
        # }else{
        #     $key = $_ + $#wd - $shift +1;
        # }

		# 連想配列生成
		$wd{$wd[$_]} = $wd[$key];
	}

	# 復号
	my $ret;
	for ( split(//,$crypt) ) { #split(//,$wd)は文字列$wdを一文字ずつ分割する。
		# 定義済は変換
		if (defined($wd{$_})) {
			$ret .= $wd{$_};

		# 未定義はそのまま
		} else {
			$ret .= $_;
		}
	}
	return $ret;
}