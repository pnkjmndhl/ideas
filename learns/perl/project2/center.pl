while ($string = <>){
	if ($string =~ /^<h(\d+)>(.*?)<\/h(\d+)>$/){
		$string =~ s:<h(\d)>:<center><h$1>:; #: used instead of / to avoid the escape
		$string =~ s:</h(\d)>:</h$1></center>:;
    }
	else {
        if ($string =~ /^<h(\d+)>/){
		    $string =~ s:<h(\d)>:<center><h$1>:; 
	        }
	    else {
		    $string =~ s:</h(\d)>:</h$3></center>:;
	    }
	print $string;
}
