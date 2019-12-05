#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict;
use warnings;
use utf8;
binmode STDIN, ':encoding(cp932)';
binmode STDOUT, ':encoding(cp932)';
binmode STDERR, ':encoding(cp932)';

# 呼び出し
my $func = func_generator(); 
$func->();  # func_generator内部の無名関数を呼び出す。

# 定義
sub func_generator {
    my $func = sub {    # 無名関数を作成。
        print "これは、実行時に生成された自作関数です。\n"; 
    }; 
    # 自作関数へのリファレンスを返す。
    return $func; 
}

# 関数ジェネレータ呼び出し
my $create_safe_msg = message_factory("is Safe."); 
my $create_keter_msg = message_factory("is Keter."); 
my $create_euqlid_msg = message_factory("is Euqlid."); 

# 生成した自作関数の呼び出し
my $safe_msg1 = $create_safe_msg->("SCP-040-JP"); 
my $keter_msg1 = $create_keter_msg->("SCP-444-JP"); 
my $euqlid_msg1 = $create_euqlid_msg->("SCP-938-JP"); 
my $keter_msg2 = $create_keter_msg->("SCP-439-JP"); 
# $create_keter_msgで "is Keter." をテンプレとして、無名関数に別の文字列を入れることで使いまわしが可能になる。

# 伝えるメッセージを指定できる自作関数を作成する関数ジェネレータ
sub message_factory {
    my $message = shift; 

    return sub {
        #無名関数を作成。
        my $word //= shift;   # shiftはshift @_の省略形です（sub内での場合）。
        return $word . ' ' . $message; 
    }
}

print "$safe_msg1\n"; 
print "$keter_msg1\n"; 
print "$euqlid_msg1\n"; 
print "$keter_msg2\n"; 



# 自作関数の名前を実行時に決定する。
# 型グロブと無名自作関数を利用することで実現できます。

# 本来の自作関数の作成方法は
# sub FunctionName {
#     #処理
# }

print "\n1: 無名自作関数に名前をつける。\n"; 
*sum = sub {    # 無名関数を作成。
    # *sum は型ブログという機能で、別名を作成することができます。
    # ここでは名前のない自作関数にsumという名前をつけています。
    # 普通に自作関数を定義した方がいいんじゃないかな？
    return $_[0] + $_[1]; 
};

print "1と2の和は、" . sum(1, 2) . "です。\n無名関数にsumという名称を付けてsum(1,2)として和を求めました。\n\n"; 

print "2: 動的に自作関数に名前をつける。\n"; 

my $word = 'cat'; 
my $func_name = "${word}_repeat";   # cat_repeat

no strict 'refs'; # シンボリックリファレンスの禁止だけを解除する。
# シンボリックリファレンスとは以下のように *{関数名}(引数) の形式で記述されたもの。
*{$func_name} = sub {   # *{cat_repeat} = sub（以下略）
    # 無名自作関数に、cat_repeat という名前を実行時に与えることができます。
    return "$word $word"; 
}; 

my $repeat_word = cat_repeat(); # コード内部では宣言されていない自作関数 cat_repeat()を宣言しているが、実行時に cat_repeat が作成されている為、エラーにはならない。
print $repeat_word . "\n\n"; 

# 関数テンプレート

print "1: 関数テンプレートを使って動的に複数の自作関数を作成する。\n"; 

# one という自作関数を呼んだら 1 が返却されるようにする。
# two という自作関数を呼んだら 2 が返却されるようにする。
my %numbers = (
    one => 1,
    two => 2,
    three => 3,
    four => 4,
);

for my $num (keys %numbers) {
    # keys %numbers : 配列 : ("one","two","three","four")
    # 無名自作関数へのリファレンスを繰り返し作成
    my $code = sub {
        # 数の名前に対応した戻り値が返る
        return $numbers{ $num }; 
    };

    # シンボリックリファレンスの制限を解除
    no strict 'refs'; 
    # 型グロブを利用して無名自作関数に名前をつける。
    *{$num} = $code; 
}

print one(),two(),three(),four(),"\n";  # 1234