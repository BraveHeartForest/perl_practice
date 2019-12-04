#!"c:\xampp7.3\perl\bin\perl.exe"
print "Content-type: text/html\n\n";
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

if (open(DATAFILE, "../data.txt")){  #./data.txtを開くための名称としてDATAFILEと名付ける。
  print "data.txtを開く事に成功しました\n<br>";
#開けていないならば閉じることに成功・失敗のどちらも起こり得ない。
  if (close(DATAFILE)){
    print "data.txtを閉じる事に成功しました\n<br>";
  }else{
    print "data.txtを閉じる事に失敗しました\n<br>";
  }
}else{
  print "data.txtを開く事に失敗しました\n<br>";
}

if (open(DATAFILE, "data1.txt")){
  print "data1.txtを開く事に成功しました\n<br>";

  if (close(DATAFILE)){
    print "data1.txtを閉じる事に成功しました\n<br>";
  }else{
    print "data1.txtを閉じる事に失敗しました\n<br>";
  }
}else{
  print "data1.txtを開く事に失敗しました\n<br>";
}

open(DATAFILE, "../data.txt") or die("error :$!\n<br>");
print "data.txtを開く事に成功しました\n<br>";

close(DATAFILE);

open(DATAFILE, "data1.txt") or die("error :$!");
print "data1.txtを開く事に成功しました\n<br>";
# 「die」関数はエラーが発生した場合にプログラムを終了させる場合に使用し、エラーメッセージを出力しPerlスクリプトを終了します。

# 特殊変数「$!」はシステムに対する要求を行った時に発生したエラーを保存しています。この変数は数値として扱うとエラーコードを返しますが、文字列として扱うとエラーメッセージを取得できます。

close(DATAFILE);