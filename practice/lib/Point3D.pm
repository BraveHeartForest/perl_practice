package Point3D;
use Point -base;

has z => 0;

sub clear {
  my $self = shift;
  
  $self->SUPER::clear;
  
  $self->z(0);
}

1;