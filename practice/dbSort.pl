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

# テーブル定義
# $dbh->do("create table member (id,name,kana);");

# データ定義
# $dbh->do("insert into member (id,name,kana) values (1004, '伊東', 'いとう');");
# $dbh->do("insert into member (id,name,kana) values (1003, '阿部', 'あべ');");
# $dbh->do("insert into member (id,name,kana) values (1005, '大野', 'おおの');");
# $dbh->do("insert into member (id,name,kana) values (1001, '伊藤', 'いとう');");
# $dbh->do("insert into member (id,name,kana) values (1002, '岡田', 'おかだ');");
# SQLiteでは問題なく日本語が入力されている。
# コマンドプロンプトではutf8

# テーブルのソート抽出命令
my $sth = $dbh->prepare("SELECT * FROM member ORDER BY id ASC;");
#idを昇順に並べ替えて取得
$sth->execute;

# 各データを展開表示
while (my @row = $sth->fetchrow_array) {
	print "@row\n";
}
$sth->finish;
undef $sth;

# 1001 ä¼è¤ ãã¨ã
# 1002 å²¡ç° ããã 
# 1003 é¿é¨ ãã¹
# 1004 ä¼æ± ãã¨ã
# 1005 å¤§é ããã®
# 一応id順に並んではいる様子。

# 切断
$dbh->disconnect;