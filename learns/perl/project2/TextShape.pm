package TextShape;

require BoxShape;

@ISA = ("BoxShape");

sub new {
	my ($class, $left, $top, $font, $text) = @_;
	bless($self, $class);
	$width = (length $text)*5;
	$height = (length %text)*20;

	$self = $class->SUPER::new($left, $top, $width, $height);
	
	$self->{font} = $font;
	$self->{text} = $text;
	return $self;

}

sub print {
	my $self = @_[0];
	print "TextShape($self->{left}, $self->{top}, $self->{width}, $self->{height}, $self->{font}, $self->{text})\n";
}

sub getText{
	my $self = @_[0];
	return $self->{text};
}

sub setText{
	my ($self, $new_text) = @_;
	$self->{text} = $new_text;
	$seft->{width} = length($new_text)*5;

}

1;

