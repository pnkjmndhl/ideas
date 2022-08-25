@values = () ;# creating an empty array

while (chomp ($line = <STDIN>)) {
	@line = split / +/, $line; #split one or more spaces
	push (@values, @line);
}
#array of values stored at @values

$sum = 0;
foreach $i (@values) {
	$sum = $sum + $i;
}

#average calculation
$avg = $sum / scalar @values; # scalar counts the number of values in the array

#sample variance calculation
$sum = 0;
foreach $i (@values) {
	$sum = $sum + ($i - $avg)**2;
}
$var = $sum / ((scalar @values) - 1);
$std = sqrt($var);

#printing out all the values
printf("average = %.2f\n", $avg);
printf("sample variance = %.2f\n",$var);
printf("sample standard deviation = %.2f\n",$std);
