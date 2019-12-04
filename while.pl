#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

print "while文による繰り返し\n<br>";

while (my $line = <STDIN>){
  chomp($line);
  if ($line eq "exit" || $line eq "") {
      last;
  }
  print "貴方は${line}と入力しました。\n<br>";
}

print "for文による繰り返し\n<br>";

for (;<STDIN>;){
  chomp($_);
#   デフォルト変数「$_」はブロック内だけのローカル変数ではありません。よってwhile文やfor文の外側で変数「$_」を使っていた場合は値が書き換えられますので注意して下さい。
  if ($_ eq "exit" || $_ eq "") {
      last;
  }
  print "貴方は${_}と入力しました。\n<br>";
}

print "終了しました\n<br>";