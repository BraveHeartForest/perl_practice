#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;   #ソースはUTF-8
use open IO => ":utf8"; #入出力ファイルの文字コードはUTF-8
use Encode; #文字コード変換用
use DBI;    #DBを使用する。
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';

# 接続
my $dbh = DBI->connect("dbi:SQLite:dbname=test.db");

# テーブルの kana ソート抽出命令
# print "テーブルの kana ソート抽出命令";
my $sth = $dbh->prepare("SELECT * FROM member ORDER BY kana ASC;");
$sth->execute;
# 1003 ﾃｩﾂ伉ｿﾃｩﾂδｨ ﾃ｣ﾂ・づ｣ﾂ・ｹ
# 1004 ﾃ､ﾂｼﾂ甘ｦﾂ敖ｱ ﾃ｣ﾂ・・｣ﾂ・ｨﾃ｣ﾂ・・
# 1001 ﾃ､ﾂｼﾂ甘ｨﾂ猟､ ﾃ｣ﾂ・・｣ﾂ・ｨﾃ｣ﾂ・・
# 1005 ﾃ･ﾂ､ﾂｧﾃｩﾂ・・ﾃ｣ﾂ・甘｣ﾂ・甘｣ﾂ・ｮ
# 1002 ﾃ･ﾂｲﾂ｡ﾃｧﾂ板ｰ ﾃ｣ﾂ・甘｣ﾂ・凝｣ﾂ・
# IDから判断するにkana順にsortされているらしい。
while (my @row = $sth->fetchrow_array) {
	print "@row\n";
}
$sth->finish;
print "\n\n";

# テーブルの条件検索命令
$sth = $dbh->prepare("SELECT * FROM member WHERE id >= 1001 AND id <=1003;");
$sth->execute;

# 各データを展開表示
while (my @row = $sth->fetchrow_array) {
	print "@row\n";
}
# 1003 ﾃｩﾂ伉ｿﾃｩﾂδｨ ﾃ｣ﾂ・づ｣ﾂ・ｹ
# 1001 ﾃ､ﾂｼﾂ甘ｨﾂ猟､ ﾃ｣ﾂ・・｣ﾂ・ｨﾃ｣ﾂ・・
# 1002 ﾃ･ﾂｲﾂ｡ﾃｧﾂ板ｰ ﾃ｣ﾂ・甘｣ﾂ・凝｣ﾂ・
# と表示されるので成功しているらしい。
print "\n\n";

# テーブルのパターン抽出
$sth = $dbh->prepare("SELECT * FROM member WHERE kana LIKE '%お%';");
$sth->execute;

# 各データを展開表示
while (my @row = $sth->fetchrow_array) {
	print "@row\n";
}
# 1005 ﾃ･ﾂ､ﾂｧﾃｩﾂ・・ﾃ｣ﾂ・甘｣ﾂ・甘｣ﾂ・ｮ
# 1002 ﾃ･ﾂｲﾂ｡ﾃｧﾂ板ｰ ﾃ｣ﾂ・甘｣ﾂ・凝｣ﾂ・
# IDから判断するに正しく「お」を含むデータの抽出に成功しているらしい。
print "\n\n";


# テーブルの二重ソート命令
# print "テーブルの二重ソート命令";
$sth = $dbh->prepare("SELECT * FROM member ORDER BY kana ASC, id ASC;");
$sth->execute;
# 1003 ﾃｩﾂ伉ｿﾃｩﾂδｨ ﾃ｣ﾂ・づ｣ﾂ・ｹ
# 1001 ﾃ､ﾂｼﾂ甘ｨﾂ猟､ ﾃ｣ﾂ・・｣ﾂ・ｨﾃ｣ﾂ・・
# 1004 ﾃ､ﾂｼﾂ甘ｦﾂ敖ｱ ﾃ｣ﾂ・・｣ﾂ・ｨﾃ｣ﾂ・・
# 1005 ﾃ･ﾂ､ﾂｧﾃｩﾂ・・ﾃ｣ﾂ・甘｣ﾂ・甘｣ﾂ・ｮ
# 1002 ﾃ･ﾂｲﾂ｡ﾃｧﾂ板ｰ ﾃ｣ﾂ・甘｣ﾂ・凝｣ﾂ・
# IDから判断するにkana順にsortされた後にidの昇順でソートされたらしい。

# 各データを展開表示
while (my @row = $sth->fetchrow_array) {
	print "@row\n";
}
$sth->finish;
undef $sth;



# 切断
$dbh->disconnect;