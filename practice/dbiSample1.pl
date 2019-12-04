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

my ($dbh, $sth);
my ($data_source, $user_name, $sql);
my ($id, $name, $addr);

$data_source = "dbi:SQLite:dbname=test.db"; #どのインターフェースを使用して、どのデータベースに接続するか「。
$user_name = 'joe'; #アクセスするユーザー名
$dbh = DBI->connect($data_source, $user_name) || die $dbh->errstr;  #失敗したらエラーメッセージを表示する

$sql = 'SELECT * FROM meibo;';
$sth = $dbh->prepare($sql) || die $dbh->errstr;
$sth->execute() || die $sth->errstr;

while (($id, $name, $addr) = $sth->fetchrow_array()) {
  print " ID\t: $id\n NAME\t: $name\n ADDRESS: $addr\n\n";
}
die $sth->errstr if $sth->err;  #sthでerrが発生したら、エラーメッセージを表示する。

$sth->finish();
undef $sth;
$dbh->disconnect();