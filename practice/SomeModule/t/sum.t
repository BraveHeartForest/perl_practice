use strict;
use warnings;

# モジュールの検索パスを追加
use FindBin;
use lib "$FindBin::Bin/../lib";
# $FindBin::Bin =  C:/xampp7.3/htdocs/perl/practice/

use Test::More tests => 1;
use SomeModule;

# sumの試験
{
  my $num1 = 1;
  my $num2 = 2;
  
  my $total = SomeModule::sum($num1, $num2);
  
  ok($total == 3, 'sum');
}