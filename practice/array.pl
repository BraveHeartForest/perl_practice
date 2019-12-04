#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

my @array = (
	"print",
	"these",
	"strings",
	"out",
	"for",
	"me", # カンマを最後に続けても問題ありません
);

print $array[0]; # "print"
print " ";
print $array[1]; # "these"
print " ";
print $array[2]; # "strings"
print " ";
print $array[3]; # "out"
print " ";
print $array[4]; # "for"
print " ";
print $array[5]; # "me"
print " ";
# print $array[6]; #unless(defined $array[6]){print "\n未定義です。";} # returns undef, prints "" and raises a warning
print "\n\n";

print $array[-1]; # "me"
print " ";
print $array[-2]; # "for"
print " ";
print $array[-3]; # "out"
print " ";
print $array[-4]; # "strings"
print " ";
print $array[-5]; # "these"
print " ";
print $array[-6]; # "print"
print " ";
# print $array[-7]; #unless( defined $array[-7] ){ print "\n未定義です。";} # returns undef, prints "" and raises a warning

print "\n\n";

print "This array has ".(scalar @array)." elements\n"; # "This array has 6 elements"
print "The last populated index is ".$#array;       # "The last populated index is 5"
print "\n\n";

my %scientists = (
	"Newton"   => "Isaac",
	"Einstein" => "Albert",
	"Darwin"   => "Charles",
);

print $scientists{"Newton"};   # "Isaac"
print "\n";
print $scientists{"Einstein"}; # "Albert"
print "\n";
print $scientists{"Darwin"};   # "Charles"
print "\n";
# print $scientists{"Dyson"}; #unless(defined $scientists{"Dyson"}) {print "Dysonは定義されていません。"}   # undefを返すので、""が出力され、警告が起きます。
my @scientists = %scientists;
print "@scientists"; # something like "Einstein Albert Darwin Charles Newton Isaac"
print "\n\n";

my $data = "orange";
my @data = ("purple");
my %data = ( "0" => "blue");

print $data;      # "orange"
print "\n";
print $data[0];   # "purple"
print "\n";
print $data["0"]; # "purple"
print "\n";
print $data{0};   # "blue"
print "\n";
print $data{"0"}; # "blue"
print "\n\n";

my @array = (
	"apples",
	"bananas",
	(
		"inner",
		"list",
		"several",
		"entries",
	),
	"cherries",
);

my %hash = (
	"beer" => "good",
	"bananas" => (
		"green"  => "wait",
		"yellow" => "eat",
	),
);

# 上のコードはwarningが出ます。ハッシュが7つ(奇数)の要素のリストで宣言されているからです。

print $hash{"beer"};    # "good"
print "\n";
print $hash{"bananas"}; # "green"
print "\n";
print $hash{"wait"};    # "yellow";
print "\n";
# print $hash{"eat"};     # undef, そのため、警告が出て、""を出力します
# beer : good
# bananas : green
# wait : yellow
# eat : UNDEFINED
# という形になっている
my @bones   = ("humerus ", ("jaw ", "skull "), "tibia ");
my @fingers = ("thumb ", "index ", "middle ", "ring ", "little ");
my @parts   = (@bones, @fingers, ("foot ", "toes "), "eyeball ", "knuckle");
print @parts;
