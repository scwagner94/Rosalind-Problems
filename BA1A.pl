#!/usr/bin/perl
#Sean Wagner
#BA1A.pl
#finding and counting all occurrences of a pattern in a string, given input
use	strict;			
use	warnings;

#takes an input file name of ba1a.txt
open FILE, "ba1a.txt" or die $!;
my $string = ""; #main string to load
my $pattern = ""; #pattern to search for
while(<FILE>) {
	if($_ eq "") {
		last; #breaks out if necessary
	}
	if($string eq "") {
		$string = $_; #gets the string, removes newline char
		$string =~ s/\n//g
	}
	else {
		$pattern = $_; #gets the string, removes newline char
		$pattern =~ s/\n//g
	}
}

#gets the correct reading frame to stop loop
my $gotolen = length($string)-length($pattern);
my $counter = 0;
#loops over string searching for pattern
for(my $i =0; $i <= $gotolen; $i++) {
	my $tempstring = substr $string, $i, length($pattern);
	#increments if pattern found
	if($tempstring eq $pattern) {
		$counter = $counter + 1;
	}
}
#prints counter at end
print $counter,"\n";
print "\n";