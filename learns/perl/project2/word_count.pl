%wordCount = ();

sub getWordCount {
	open(IN, $_[0]); 
	while (chomp($line = <IN>)){
		$line =~ s/^\s+//; #only one space between words
		@words = split(/\s+/, $line); #put all the words in the array		
		foreach $word (@words){
			$word =~ s/\W*(.*?)\W*/$1/;
    			$word =~ s/(\W.*\W.*)//g;
    			$word =~ s/[[:punct:]]//g; #special characters removed
			$wordCount{lc $word}++;
 		}
	}
return %wordCount;
}

sub printResult {
	my @keys = sort {
        $wordCount{$b} <=> $wordCount{$a} or $a cmp $b
        } 
        keys(%wordCount);
	for $word (@keys) {
        print "$word: $wordCount{$word}\n"; }
    }
	for ($values = 0; $values <= $#ARGV; $values++) { # $# gives the number of arguments provided
	    getWordCount("$ARGV[$values]"); #for each argument, get wordcount
}

&printResult;
