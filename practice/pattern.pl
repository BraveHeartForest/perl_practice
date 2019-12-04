#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# ○正規表現の概要   ----------------------------------------------------

# 表現方法	意味
# .	一文字のワイルドカード
# *	直前の文字が0個以上の繰り返し
# ?	直前の文字が0個または1個
# +	直前の文字の1回以上の繰り返し
# ^	行頭にマッチ
# $	行末にマッチ
# [ ]	特定の文字と一致 [a-z]ならaからzにマッチ
# |	複数パターンのいずれか
# ( )	グループ化
# \	直後の文字をエスケープ



# ○パターンマッチ   ----------------------------------------------------

# ▼条件式
# 文字列 =~ /正規表現で書かれたパターン/

my $str;

$str="testhellotest";

if($str=~/hello/){
	print "\$strに`hello`はふくまれています\n";
}else{
	print "\$strに`hello`はふくまれていません\n";
    #実際に文字列か正規表現部分を編集するとfalseに分岐する。
}

# 処理結果
# ふくまれています

# ■1文字だけのワイルドカードは . です

$str="testhellotest";

if($str=~/h...o/){
	print "\$strに`h...o`はふくまれています\n";
}else{
	print "\$strに`h...o`はふくまれていません\n";
}

# 処理結果
# ふくまれています

# ■複数文字のワイルドカードは * です

$str="testhellotest";

if($str=~/h*o/){
	print "\$strに`h*o`はふくまれています\n";
}else{
	print "\$strに`h*o`はふくまれていません\n";
}

# 処理結果
# ふくまれています


# ○文字列置換    ----------------------------------------------------

# 文字列 =~ s/正規表現で書かれたパターン/置換する文字列/
# ,/g   複数の文字を入れ替えるオプション

# ■スペースをすべて取り除く
$str="   Hello test            test   \n";
$str=~ s/\s+//g;
print $str."\n↑はスペースを全て取り除きました。\n";

# 処理結果
# Hellotesttest

# ■スペースを , に置換
$str="   Hello test            test   \n";
$str=~ s/\s+/,/g;
print $str."\n↑はスペースを全て`,`に変換しました。\n";

# 処理結果
# ,Hello,test,test,

# ■先頭のスペースを削除

$str="   Hello test            test   ";
$str=~ s/^\s+//;
print $str;
print "|\n↑はスペースを先頭だけ取り除きました。\n";

# 処理結果
# Hello test            test   |

# ■末端のスペースを削除

$str="   Hello test            test   ";
$str=~ s/\s+$//;
print $str;
print "|\n↑はスペースを末尾だけ取り除きました。\n";

# 処理結果
#    Hello test            test|

# ■文字列置換
# testという文字列を検索してinabaに置換する

$str="   Hello test            test   \n";
$str=~ s/(?:test)/inaba/g;
print $str."↑はtestをinabaに置換しました。\n";

# 処理結果
#    Hello inaba            inaba

# ▼一文字のワイルドカードは . です
$str="   Hello test            test   \n";
$str=~ s/(?:t..t)/inaba/g;
print $str."↑はt...tをinabaに置換しました。\n";

# 処理結果
#    Hello inaba            inaba

# ▼複数の文字のワイルドカード::.+ です
$str="   Hello test            test   \n";
$str=~ s/(?:t.+t)/inaba/g;
print $str."↑はt.+tをinabaに置換しました。\n";

# 処理結果
#    Hello inaba

# ▼複数の文字列をマッチさせて置換する::文字列::Hello と::test を::inaba::に置換する
$str="   Hello  Perl  test            test   \n";
$str=~ s/(?:Hello) | (?:test) /inaba/g; #Helloもしくはtestをinabaに変換する。
print $str."↑はHello|testをinabaに置換しました。\n";

# 処理結果
#    inaba Perl inaba          inaba

# ■文字の置換

# ▼tをAに置換する

$str="   Hello test            test   \n";
$str=~ s/[t]/A/g;
print $str."↑はtをAに置換しました。\n";
# 処理結果
#    Hello AesA            AesA

# ▼tという文字をAAAに置換する

$str="   Hello test            test   \n";
$str=~ s/[t]/AAA/g;
print $str."↑はtをAAAに置換しました。\n";

# 処理結果
#    Hello AAAesAAA            AAAesAAA

# ▼o と tの文字を A に置換する
$str="   Hello test            test   \n";
$str=~ s/[ot]/A/g;
print $str."↑はoとtをAに置換しました。\n";

# 処理結果
#    HellA AesA            AesA

# ▼複数の文字 lをAに置換する

$str="   Hello test    lllll    test   \n";
$str=~ s/l+/A/g;
print $str."↑は複数のlをAに置換しました。\n";

# 処理結果
#    HeAo test    A    test

# ■全ての文字を小文字にします

$str="   Hello  Perl  test  test   \n";
$str=lc($str);
print $str."↑は全ての文字を小文字にしました。\n";

# 処理結果
#    hello  perl  test  test

# ■全ての文字を大文字にします
$str="   Hello  Perl  test  test   \n";
$str=uc($str);
print $str."↑は全ての文字を大文字にしました。\n";

# 処理結果
#    HELLO  PERL  TEST  TEST

# ■先頭の一文字を大文字にします
$str="test\n";
$str=ucfirst($str);
print $str."↑は先頭の一文字を大文字にしました。\n";
