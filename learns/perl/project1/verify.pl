@record = (); #empty list
while (chomp($value = <>)) { #unless reaches the end of line
	push(@record, $value);
}
#room type check
if ($record[0] !~ /^double$|^queen$|^king$|^suite$/) { # if value not matches
	print "Roomtype must be double or queen or king or suite.\n";
}

#checkin date check
if ($record[1] !~ /^\d{1,2}-\d{1,2}-20\d{2}$/){
	print "The date formatting should be mm-dd-20yy.\n";
}
#check name
if ($record[2] !~ /[\w]{1,30}/) {
	print "The name should be alphanumeric and less than 30 characters. \n";
}

#check club member identifier
if ($record[3] !~ /^(pl|gl)\-?[1-9][0-9]{3}$/) {
	print "The membership id should of format pl-dddd or gl-dddd; dddd is a number between 1000 and 9999";

}

#check phone number
if ($record[4] !~ /^(011|\(011\))[-| ]\d{1,3}[-| ]\d{2}[-| ]\d{3}-\d{4}$/) {
    print "The format doesnot match";

}

