#!"c:\xampp7.3\perl\bin\perl.exe"

# 名簿検索システム-1
# created by (c)kentweb

use strict;
use CGI::Carp qw(fatalsToBrowser);
use DBI;	#DBの使用を宣言。
use CGI;	#cgiの使用を宣言。
my $cgi = new CGI;

# 引数を受取り
my $sort = $cgi->param('sort');
my $sex  = $cgi->param('sex');
my $word = $cgi->param('word');

# 引数の正当性
$sort =~ s/\D//g;
$sex  =~ s/\D//g;
# 「s/パターン/置換文字列/」「\Dは数字以外の文字」「/gは繰り返しマッチング」
# 以上の点から「s/\D//g」は「数字以外の文字は全部削除する」という意味合いを持つ。
# ∴1or2などを入力しても12に変換されてしまうためSQLインジェクションが簡単には出来ない。
$word =~ s/[<>&"'\r\s!#$\%()*+,\-.\/:;=?@\[\]\\^_`{}|~]//g;	#";
#[<>&"'\r\s!#$\%()*+,\-.\/:;=?@\[\]\\^_`{}|~]を全部削除する。
#結果の一例としては[1&2]と入力すると[1%262]と表示される。

# SELECT文
my $select = "SELECT * FROM member";

# 性別条件__この部分を利用してSELECT文にWHERE句を付け加える。
my $flg;
if ($sex == 1) {
	$flg++;
	$select .= " WHERE sex = '男'";
} elsif ($sex == 2) {
	$flg++;
	$select .= " WHERE sex = '女'";
}

# キーワード
if ($word ne '') {
	#キーワードが何か入力されているならば、
	if ($flg) {
		#性別条件が選択されているならば、
		$select .= " AND (";
		#「 SELECT * FROM member WHERE sex = 'x' AND ( 」という形でSQL文が出来上がる。
	} else {
		#性別条件が選択されていないならば、
		$select .= " WHERE";
		#「 SELECT * FROM member WHERE 」という形でSQL文が出来上がる。
	}
	$select .= " name LIKE '%$word%' OR kana LIKE '%$word%'";	#nameかkanaのどちらかに検索ワードが入っているかを確認する。
	$select .= ")" if ($flg);	# $flgが1ならば最後に)を付け加える。
}

# ソート条件__この部分を利用してSELECT文にORDER BY句を付け加える。
if ($sort == 1) {
	$select .= " ORDER BY id ASC;";
} else {
	$select .= " ORDER BY id DESC;";
}

# DB接続
my $dbh = DBI->connect("dbi:SQLite:dbname=member.db");

# 命令実行
my $sth = $dbh->prepare($select);
$sth->execute;

&header();	#サブルーチンです。ヘッダー部分がテンプレートとして用意されているだけです。
print <<EOM;
<table>
<tr>
	<th>会員ID</th>
	<th>名前</th>
	<th>ふりがな</th>
	<th>性別</th>
	<th>住所</th>
</tr>
EOM

# データ抽出
while (my ($id,$name,$kana,$sex,$addr) = $sth->fetchrow_array) {
	print qq|<tr>\n\t<td>$id</td>\n|;
	print qq|\t<td>$name</td>\n|;
	print qq|\t<td>$kana</td>\n|;
	print qq|\t<td>$sex</td>\n|;
	print qq|\t<td>$addr</td></tr>\n|;
}

# 完了
$sth->finish();
undef $sth;
$dbh->disconnect;

print <<EOM;
</div>
</body>
</html>
EOM

#-----------------------------------------------------------
#  ヘッダー
#-----------------------------------------------------------
sub header {
	print <<EOM;
Content-type: text/html; charset=utf-8

<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>名簿データベース</title>
    <style type="text/css">
        body,
        td,
        th {
            font-size: 90%;
            font-family: Verdana, Helvetica, Arial;
        }

        table {
            bORDER-collapse: collapse;
            margin: 1em 0;
        }

        td,
        th {
            bORDER: 1px solid #555;
            padding: 8px;
        }

        th {
            background: #ccc;
        }
    </style>
</head>

<body>
EOM
}