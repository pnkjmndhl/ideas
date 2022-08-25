($a, $b) = @ARGV;
print "The given parameters are ", $a, " and ", $b. "\n";
print "The value of e^", $a , " upto ", $b, " terms  = ", e($a, $b);
print "\n";


sub e {
	my($a, $b) = @_;
	my $sum = 0;
	my $n = 0;
	my $i = 1;

	until ($b < 0 ) {
		$b = $b -1;
		$sum = $sum + $a**$n / $i;
		$n = $n +1 ;
		$i = $i * $n;
	}
	return $sum;

}
 
