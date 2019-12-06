package Point;
use Object::Simple -base; #base直下のObject::Simpleを使用することを宣言？

has x => 0;
has y => 0;

sub clear {
  my $self = shift;
  
  $self->x(0);
  $self->y(0);
}

1;