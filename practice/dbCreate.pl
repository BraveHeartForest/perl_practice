#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
use open ":utf8";
use DBI;    #DBを使用する。
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';

# 接続
my $dbh = DBI->connect("dbi:SQLite:dbname=test.db");
#DataBaseHandle

# テーブル定義
$dbh->do("create table meibo (id,name,addr);") or die("Error : $!");
#テーブル名：meibo
#カラム名   ：id,name,addr
#というテーブルを作成する。

# データ定義
$dbh->do("insert into meibo (id,name,addr) values (1001,'Joseph W. Wei','976 Oak Avenue Arlington Heights, IL 60004');");
$dbh->do("insert into meibo (id,name,addr) values (1002,'Julia J. Peterson','16, Athenas St. 5563 Kalopsida');");
$dbh->do("insert into meibo (id,name,addr) values (1003,'Patrick L. Willingham','Gl. Sygehusvej 271 3921 Narsaq');");

# 切断
$dbh->disconnect;

#完了
print "OK\n";