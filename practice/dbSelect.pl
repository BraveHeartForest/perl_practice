#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
use open IO => ":utf8";
use DBI;    #DBを使用する。
binmode STDIN, ":encoding(utf8)";	#:encoding(cp932)=shift_jis
binmode STDOUT, ":encoding(utf8)";
binmode STDERR, ":encoding(utf8)";

# 接続
my $dbh = DBI->connect("dbi:SQLite:dbname=test.db") or die $DBI::errstr;
# DataBaseHandle（データベースの指定）
# $dbh = DBI->connect($data_source, $username, $auth);
# DataBaseInterface:SQLite

# $data_source	DB接続用文字列
# $username	DBの接続ユーザ
# $auth	DBの接続パスワード

# データ追加
$dbh->do("INSERT INTO meibo (id,name,addr) VALUES (1004,'鈴木','千葉県');");
$dbh->do("INSERT INTO meibo (id,name,addr) VALUES (1005,'Frances D. Sharpe','332 Hope Street Portland, OR 97232');");
#doはSQL文の実行を意味します。内部的にはprepareし、executeし、finishしています。データを受け取れないので、select文では使う意味がありません。doは、insert、update、delete等を実行するのにとても便利です。
#相変わらず文字化けします。

#データ削除
$dbh->do("DELETE FROM meibo WHERE id=1004");
# $dbh->do("DELETE FROM meibo WHERE id=1005");

#データ更新
$dbh->do("UPDATE meibo SET addr='address' WHERE id=1005;");

# テーブルの読み出し命令
my $sth = $dbh->prepare("SELECT * FROM meibo");	#prepareでSQL文を準備。
# STatementHandle
$sth->execute;	#準備されたSQL文を実行する。
# DBI/DBDモジュールでは、SELECT文の定義は prepare で、その命令実行を execute で行います。


# 各データを展開表示
while (my @row = $sth->fetchrow_array) {
	#fetchrow_arrayは行データを項目の配列として返す。
	#出力されるデータは一行ごとに受け取りますので、while文で展開します。
	print "@row\n";
}
$sth->finish;	#命令を終了するにはfinishを宣言します。準備したSQL文を開放する。　
undef $sth;	#環境によっては実行後にエラーが吐き出されるのでそれを回避するためです。

# 切断
$dbh->disconnect;