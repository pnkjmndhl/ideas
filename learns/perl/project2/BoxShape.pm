package BoxShape;

sub new {

	my ($class, $left, $top, $width, $height) = @_;
	my $self = {};
	bless ($self, $class);
	$self->{left} = $left;
	$self->{top} = $top;
	$self->{width} = $width;
	$self->{height} = $height;

return $self;

sub print {
	my $self = @_[0];
	print "BoxShape($self->{left}, $self->{top}, $self->{width}, $self->{height})\n";
}

sub containsPt {
	my($self, $x, $y) = @_;
	$self->{x} = $x;
	$self->{y} ] $y;
	$right = $self->{left} + $self->{width};
	$bottom = $self->{top} + $self->{height};
	if ( ($self->{x} > $self->{left}) and ($self->{x} < $right) and ($self->{y}>$self->{top}) and ($self->{y} < $bottom) ) {
		return 1;
	}
	else {
		return 0;
	}
}

sub getBounds {
	my $self = @_[0];
	return ($self->{left}, $self->{top}, $self->{width}, $self->{height});
}

sub setBounds {
	my ($self, $left, $top, $width, $height) = @_;
	$ref = $self->{left};
	$ref = $self->{top};
	$ref = $self->{width};
	$ref = $self->{height};
}
1;

