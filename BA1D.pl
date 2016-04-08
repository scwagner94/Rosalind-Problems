#!/usr/bin/perl
#Sean Wagner
#BA1D.pl
#finding and keeping track of all the locations where the pattern occurs
use	strict;			
use	warnings;

#takes an input file name of ba1d.txt
open FILE, "ba1d.txt" or die $!;
my $string = ""; #main string to load
my $pattern = ""; #pattern to search for
while(<FILE>) {
	if($_ eq "") {
		last; #breaks out if necessary
	}
	if($pattern eq "") {
		$pattern = $_; #gets the string, removes newline char
		$pattern =~ s/\n//g
	}
	else {
		$string = $_; #gets the string, removes newline char
		$string =~ s/\n//g
	}
}

#gets the correct reading frame to stop loop
my $gotolen = length($string)-length($pattern);
my @locations;
#loops over string searching for pattern
for(my $i =0; $i <= $gotolen; $i++) {
	my $tempstring = substr $string, $i, length($pattern);
	#increments if pattern found
	if($tempstring eq $pattern) {
		push @locations, $i;
	}
}
#prints counter at end
@locations = reverse(@locations);
my $outputS = "";
while (@locations) {
	my $currString = pop @locations;
	$outputS = $outputS . $currString . " ";
}
$outputS = substr $outputS,0,-1;
print $outputS;
print "\n";