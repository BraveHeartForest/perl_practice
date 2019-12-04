#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# モジュール宣言
use Digest::MD5;

# 画像ファイル
my @file = qw/dog1.gif dog2.gif dog3.gif dog4.gif/;

# データ読み込み
my (%file,%uniq);
for(@file) {
    #画像読み込み
    open(IN,"$_") or die;   # $_は@fileの各要素を順に代入。
    binmode(IN);    #何これ？
    my $digest = Digest::MD5->new->addfile(*IN)->hexdigest; # md5に変換したときの文字列を取得。何をやっているのか不明。
    close(IN);  # MD5の値を取得したので閉じる。

    #MD5値が重複するもの
    if (defined($file{$digest})) {
        # %fileのキー$digestが定義済みならば（#MD5値に対応するファイル名を記憶させる。の部分で定義される）
        $uniq{$digest}++;
        # %uniqのキー$digestの値を+1する。これによって定義済みのものが再び出現したものは%uniqに記憶される。
    }

    #MD5値に対応するファイル名を記憶させる。
    $file{$digest} .= "$_,";    #文字列、「sample1.gif,sample2.gif,...sampleN.gif,」
    # %file = ($digest => $_);
}

#重複したものを展開
for (keys %uniq) {
    print "$_ : $file{$_}\n";
    # $_は「%uniqのkey全部を配列として取得」したときの全要素を順に代入したもの。
}

# for my $keys (%file) {
#     print "$keys\n";
#     # 実行結果は以下の通りです。
#     # d2094ae7f078a7d3159066e023607acc
#     # dog1.gif,dog4.gif,
#     # 255a0a9252b075e764b6458637640406
#     # dog2.gif,
#     # 34dc9f7f97959eb89a2001b7dc0be83a
#     # dog3.gif,
# }

# for my $keys (%uniq) {
#     print "$keys\n";
#     # 実行結果は以下の通りです。
#     # d2094ae7f078a7d3159066e023607acc
#     # 1
# }

# 実行結果は以下の通りです。
# d2094ae7f078a7d3159066e023607acc : dog1.gif,dog4.gif,