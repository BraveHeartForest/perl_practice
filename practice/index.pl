#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';

my $str = "apple orange banana";
my $sub = "a";
my $find=0;
while ( ($find = index($str, $sub, $find) ) >= 0 ) {
    #見つからない場合はindexは-1となるので>=0でOK
	$find++;
	print "${find}番目に発見。\n";
}

opendir(DIR, ".");  # "."に対してDIRという名前を付ける。
my @dir = readdir(DIR); #中身を読み取る。
closedir(DIR);

foreach (@dir) {
	next if (/^\.{1,2}$/); # . と .. を排除

	print "$_\n";
} 
print "\nforeachで取り出すのはここで終了。\n\n";

# ディレクトリ内の情報を読み出す
@dir = glob('*');
print join("\n", @dir), "\n";
print "\nglob関数はここで終了。\n\n";

# ディレクトリ内の情報を読み出す
@dir = <*>;
print join("\n", @dir), "\n";