#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# 通常ファイルの存在を確認する。
# -f ファイル名
{
  print "1: 通常ファイルの存在を確認する。 -f \n";
  my $file = 'a.txt'; # これは存在しない
  # my $file = 'filetest.pl'; # これは存在する。
  if (-f $file) {
    print "'$file' は、存在します。\n\n";
  } else { 
    print "'$file' は、存在しません。\n\n"
  }
}



# ディレクトリの存在を確認する。
# -d ディレクトリ名
{
  print "1: ディレクトリの存在を確認する。 -d \n";
  # my $dir = 'd'; # これは存在しない
  my $dir = './SomeModule'; # これは存在する。
  # my $dir = 'SomeModule'; # これは存在する。
  if (-d $dir) { 
    print "'$dir' は、存在します。\n\n";
  } else {
    print "'$dir' は、存在しません。\n\n"
  }
}

# ファイルの存在を確認する。
# -e ファイル名
# -e を使えば、ディレクトリやファイルやシンボリックリンクなど
# を区別せずに、それが、存在するかどうかを確認できます。
{
  print "1: ファイルの存在を確認する。 -e \n";
  my $file_all_type = 'a'; # これは存在しません。
  # my $file_all_type = 'filetest.pl'; # これは存在する。
  # my $file_all_type = 'filetest'; # これは存在しません。

  if (-e $file_all_type) {
    print "'$file_all_type' は、存在します。\n\n";
  } else { 
    print "'$file_all_type' は、存在しません。\n\n" 
  }
}

# ファイルのサイズを取得する。
# -s ファイル名
# 単位は、バイトです。
{
  print "1: ファイルのサイズを取得する。 -s\n";
  my $file = "filetest.pl";
  if (-f $file) {
    my $file_size = -s $file;
    print "$file のファイルサイズは、$file_size バイトです。\n\n";
  } else { 
    print "$file は、存在しませんでした。\n\n"
  }
}


# {
#   print "2: ファイルサイズがあるバイトを超えたら出力をとめる。\n";

#   my $file = "output_$$.txt"; # この名称のファイルを作成する予定。$$はプロセスIDが格納されている特殊変数。
#   if (-e $file) {
#     die "$file は存在します。\n"; # 既に存在するファイルならばエラー。
#   }

#   open my $fh, ">", $file
#     or die "File open error : $!";

#   while (-s $file < 1_000_000) {  # ファイルサイズが1,000,000を超えない間繰り返す。
#     my $string = ('/' x 99) . "\n";
#     print $fh $string;  # $fhに対して$stringの内容を書き込む。
#   }

#   print "出力後の $file のファイルサイズは、" ;
#   print  -s $file;
#   print  "バイトです。\n";

#   close $fh;
# }

{
  # 最終更新から経過した日数を取得する。
  # -M $file

  print "1: 最終更新から経過した日数を取得する。\n";
  my $file = "template.pl";
  if (-e $file) {
    my $from_last_modify = -M $file;
    # $from_last_modify += 0; #文字列型を数値型に変換する。
    $from_last_modify = int $from_last_modify; # 整数部分を取得する。
    print "最終更新から $from_last_modify 日経過しています。\n\n";
  } else {
     print "$file は存在しません。\n\n"
  }
}

{
  # 最終アクセス(読み取り)から経過した日数を取得する。
  # -A $file

  print "1: 最終アクセスから経過した日数を取得する。\n";
  my $file = "template.pl";
  if (-e $file) {
    my $from_last_access = int -A $file;
    print "最終アクセスから $from_last_access 日経過しています。\n\n";
  } else {
    print "$file は存在しません。\n\n" 
  }
}