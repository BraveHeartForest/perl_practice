#!"c:\xampp7.3\perl\bin\perl.exe"
# print "Content-type: text/html\n\n";  #html表示する場合は有効にする。
use strict; 
use warnings; 
use utf8; 
binmode STDIN, ':encoding(cp932)'; 
binmode STDOUT, ':encoding(cp932)'; 
binmode STDERR, ':encoding(cp932)'; 

# もっともシンプルなクロージャ
{
    # 変数の生成
    my $var = 5; 
    sub var {
        return $var; 
    }
}
# スコープが終わってもvarサブルーチンに参照されているため、
# $var は存在し続ける。
# var サブルーチンだけが、$var を見ることが可能。

print "1: もっともシンプルなクロージャ\n"; 
print var(), "\n";  # 5
# print "$var\n"; #これを有効にするとエラーで動かなくなる。

# # タイマーを生成する。
# print "1: 関数ジェネレータでクロージャを生成する( タイマー )。\n"; 
# my $timer1 = create_timer(); # タイマー1開始；戻り値は自作関数へのリファレンスです。
# sleep 1; 
# # 1秒後にもうひとつタイマーを生成
# my $timer2 = create_timer(); # タイマー2開始

# # 1秒止まる
# sleep 1; 

# print '$timer1 による経過秒: '; 
# print $timer1->(), "\n";    # タイマー1ストップ：結果＝2

# print '$timer2 による経過秒: '; 
# print $timer2->(), "\n\n";  # タイマー2ストップ：結果＝1


# 経過時刻を知るクロージャを生成する「関数ジェネレータ」
sub create_timer {
    # time() は、「関数ジェネレータ」が呼び出された時刻
    my $time = time(); 
    # time関数は現在時刻を取得するもの。今回は呼び出された時刻を取得。

    return sub {
        # time() は生成されたサブルーチンが呼び出された時刻。
        # time() - $time で経過時刻を知ることができる。
        return time() - $time; 
    }
}



# 関数ジェネレータに引数として渡す。
print "1: クロージャに参照される変数を初期化する。\n";
my $sign_inversion = create_sign_checker(1); # クロージャーを生成（参照される変数を1で初期化する）

if ($sign_inversion->(-2)) {    # クロージャーを呼び出す。
    # 符号が反転していたら
    print "-2 は、1から見て符号が反転しています。\n";
}

# 符号が反転したかどうかを確かめるクロージャを生成する関数ジェネレータ
sub create_sign_checker {
    # クロージャを作成したときに初期化される。
    my $num1 = shift; # 今回の例では 1

    return sub {
        # クロージャを呼び出したときの引数。
        my $num2 = shift; # 今回の例では -2

        if ($num1 * $num2 > 0) {
        # 反転していない場合
        return 0; 
        }
        elsif ($num1 * $num2 < 0) {
        # 反転している場合
        return 1; 
        }
        else {
        # どちらかが0の場合undefを返す
        return; 
        }
    }
}
print "\n";

package Counter;    # perlでのクラスの実装方法
sub new {
    my $class = shift;  # shift @_の略。第一引数を代入する。
    my $self = {};  # 連想配列のリファレンスであることを宣言。
    $self->{cnt} = shift;   # $selfのcnt=>第二引数、という結果を齎すと思われたが、どうも違うらしい。第一引数が代入されている模様。
    bless $self, $class;    # オブジェクトの生成。
}

sub add_count {
    my $self = shift;   # 引数を与えられていないが、&new で設定した$selfが代入されている模様。
    $self->{cnt}++; # $self->{cnt}の値に+1する。
}

sub count {
    my $self = shift;   # 引数を与えられていないが、&new で設定した$selfが代入されている模様。
    return $self->{cnt};    # 無名ハッシュリファレンスの cnt キーの値を返す。
}

package main;
my $cnt = Counter->new(10); # クラスCounterを生成。初期値として10を与える。

print "1: クラスによるカウンターの実装\n";
print "カウント前:", $cnt->count, "\n"; # $cnt->countでカウンターの値が表示される。
$cnt->add_count;    # add_countによってカウンターが+1される。
print "カウント後:", $cnt->count, "\n\n";

# クロージャ
sub make_counter {
    my $self = {};  # 無名ハッシュリファレンスであることを宣言。
    $self->{cnt} = shift;

    # クロージャでは、サブルーチンへのリファレンスを使ってメソッドを実装する。
    my $funcs = {}; 
    $funcs->{add_count} = sub { # 無名サブルーチンを定義。
        $self->{cnt}++;
    };

    $funcs->{count} = sub { # 無名サブルーチンを定義。
        return $self->{cnt};
    };
    return $funcs;
}

my $cnt = make_counter(-10);

print "2: クロージャによるカウンターの実装\n";
print "カウント前:" . $cnt->{count}->() . "\n"; 
$cnt->{add_count}->();
print "カウント後:" . $cnt->{count}->() . "\n";

