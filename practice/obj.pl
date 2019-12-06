use strict;
use warnings;
use lib 'lib'; 


use Point3D;

my $point = Point3D->new(x => 3, y => 5, z => 8);

# 8と表示される
print $point->z . "\n";

$point->z(9);

# 9と表示される
print $point->z . "\n";
$point->clear;

# 0と表示される
print $point->z . "\n";
