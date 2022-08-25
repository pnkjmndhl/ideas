$write_tofile = "";
$sum = 0;
$count = 0;

open (IN, "<", $ARGV[0]);
while (chomp ($time = <IN>)) {	
	$time =~ s/<time>\s*(?<hh>\d+)\:(?<mm>\d+)\:(?<ss>\d+)\s*<\/time>/$1 hours $2 minutes $3 seconds /g;
	$write_to_file .= $time;
	$sum = $sum + $+{ss} + $+{mm} *60 + $+{hh} *3600; 
	$count +=1;
}
$average_time = $sum/$count;
print $average_time, "\n";

#calculation of hour minutes and seconds
$hh = int($average_time / 3600);
$mm = int(($average_time-(3600*$hh))/60);
$ss = int(($average_time - (3600*$hh) - 60*$mm )); 
printf ("Average time = %d:%02d:%02d\n", $hh, $mm, $ss);


open (OUT, ">", $ARGV[1]);
print OUT $write_to_file;
