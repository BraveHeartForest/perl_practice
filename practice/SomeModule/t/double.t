use strict;
use warnings;

# モジュールの検索パスを追加
use FindBin;
use lib "$FindBin::Bin/../lib";

use Test::More tests => 1;
use SomeModule; 

# doubleの試験
{
  my $num1 = 1;
  
  my $double = SomeModule::double($num1);
  
  ok($double == 2, 'double');
}