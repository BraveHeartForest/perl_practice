# conv.pl
# created by kent

use strict;
use Encode;
use DBI;

# DB接続
my $dbh = DBI->connect("dbi:SQLite:dbname=member.db");

# テーブルの作成
my $table = <<'EOM';
create table member (
	id integer,
	name,
	kana,
	sex,
	addr
)
EOM

# テーブル定義
$dbh->do($table);

# CSV読み込み
open(IN,"member.csv") or die("Error : $!");
while( my $csv = <IN> ) {
	chomp($csv); #改行文字を外す。

	# コード変換 sjis → utf8
	Encode::from_to($csv, 'shiftjis', 'utf8');

	# 分割
	my ($id,$name,$kana,$sex,$addr) = split(/,/,$csv);
    
	# DBへ流し込み
	$dbh->do("insert into member (id,name,kana,sex,addr)
				values ($id,'$name','$kana','$sex','$addr');");
}
close(IN);

# DB切断
$dbh->disconnect;

# 完了
print "OK\n";