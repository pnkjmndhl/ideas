while (chomp ($line = <STDIN> )) {
	$line =~ s/^\s+//;# replace leading spaces with empty
	@values = split(/\s+/, $line);
	foreach $word (@values) {
		if(exists ($dict{$word})){ # found word in the dictionary
			$dict{$word} = $dict{$word}+1;
			}
		else {
			$dict{$word} = 1; # first occurance
		}
	}
}

#print the values
foreach $word (keys(%dict)){
	print "$word: $dict{$word}\n";
}
