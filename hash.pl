#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my %address;    #ハッシュ（連想配列）の宣言

$address{'katou'}= "Tokyo";
$address{'山田'}= "大阪";

print "$address{'katou'} \n<br>";   #Tokyo
print "$address{'山田'} \n<br>\n<br>";  #大阪

my %names;

$names{"鈴木"}= "一郎";
$names{'山田'}= "太郎";

my $name = "山田";
print "$names{$name}\n<br>\n<br>";  #太郎


#連想配列の初期化
my %address2 = (
    "鈴木" => "東京都千代田区",
    "山田" => "東京都葛飾区"
);

print "$address2{'鈴木'}\n<br>";    #東京都千代田区
print "$address2{'山田'}\n<br>\n<br>";  #東京都葛飾区

print "%address2\n<br>"; #単に「%address2」と言う文字列が出力されます。
print "$address2{'鈴木'}\n<br>\n<br>";

foreach my $key(keys(%address2)){
  print "$address2{$key}\n<br>";
#   print "$key\n<br>"; @key = ("山田","鈴木");
}
print "\n<br>";
# 「keys」関数は対象となるハッシュに含まれている全てのキーをリストの形で返します。詳しくは「keys関数」を参照して下さい。

while (my ($key, $value) = each(%address2)){
  print "key=$key, value=$value\n<br>";
}
# 「each」関数は対象となる連想配列に含まれている要素を順に取り出します。詳しくは「each関数」を参照して下さい。

# ハッシュの要素には順序がありませんので、どちらの場合も要素がどのような順序で取り出されるかは分かりません。