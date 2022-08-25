print "Enter time in format (hh:mm:ss): ";

while (chomp($time = <STDIN>)) {
	@time = split /:/, $time;

	if ($time[0] <12) {
		$AM_PM = "am";
	}
	else {
		$time[0] = $time[0] - 12;
		$AM_PM = "pm";
	}	
	$militarytime = join ":", @time;
	print "Military Time: ", $militarytime, $AM_PM, "\n";

	print "Enter time in format (hh:mm:ss): ";
}
	
