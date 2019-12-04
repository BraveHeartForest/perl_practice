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
my ($id, $name, $zip, $addr, $tel);
my ($ary, $num, $i);

$data_source = "dbi:SQLite:dbname=test.db";
$user_name = 'joe';
$dbh = DBI->connect($data_source, $user_name) || die $dbh->errstr;

$sql = 'SELECT * FROM meibo;';
$ary = $dbh->selectall_arrayref($sql) || die $dbh->errstr;
$num = @$ary;   # @$aryの要素数。
for ($i = 0; $i < $num; $i++) {
  print " ID\t : $ary->[$i][0]\n Name\t : $ary->[$i][1]\n Address : $ary->[$i][2]\n\n";
#   print "$ary->[$i][3], $ary->[$i][4]\n";
}
undef $ary;
$dbh->disconnect();