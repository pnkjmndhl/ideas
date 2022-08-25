%grades = ();
while(chomp($student = <STDIN>)){
	@line = split /,/, $student;
	$grades{$line[0]}{firstname} = $line[1];
	if ($line[2] =~ /hw/) {
		$grades{$line[0]}{hw} = $line[3];
	}
	elsif ($line[2] =~ /midterm/) {
		$grades{$line[0]}{midterm} = $line[3];
	}
	else {
		$grades{$line[0]}{final} = $line[3];
	}
}
foreach $key (keys(%grades)){
	$grades{$key}{sum} = 0.2*$grades{$key}{hw} + 0.3* $grades{$key}{midterm} + 0.5*$grades{$key}{final};
}

#printing all the values
foreach $key (keys(%grades)){
	print $key, ",",$grades{$key}{firstname}, ",", $grades{$key}{sum} ,"\n";
}

