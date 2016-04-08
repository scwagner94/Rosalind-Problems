#!/usr/bin/perl
#Sean Wagner
#BA1H.pl
#combination of two prior problems, finds pattern match with max number differences
use	strict;			
use	warnings;

#takes an input file name of ba1a.txt
open FILE, "ba1h.txt" or die $!;
my $string = ""; #main string to load
my $pattern = ""; #pattern to search for
my $minCount = 0;
my $currLine = 0;
while(<FILE>) {
	if($currLine == 0) {
		$pattern = $_; #gets the string, removes newline char
		$pattern =~ s/\n//g
	}
	elsif($currLine == 1) {
		$string = $_; #gets the string, removes newline char
		$string =~ s/\n//g
	}
	elsif($currLine == 2) {
		$minCount = $_;
	}
	$currLine++;
}

#gets the correct reading frame to stop loop
my $gotolen = length($string)-length($pattern);
my @locations;
#loops over string searching for pattern
for(my $i =0; $i <= $gotolen; $i++) {
	my $tempstring = substr $string, $i, length($pattern);
	#need to find hamming distance in here now
	my @s1list;
	my @s2list;
	for my $curChar (split //, $tempstring) {
		push @s1list, $curChar;
	}
	for my $curChar1 (split //, $pattern) {
		push @s2list, $curChar1;
	}
	my $curWordCounter = 0;
	while(@s1list) {
		my $one = pop @s1list;
		my $two = pop @s2list;
		#checks the hamming distances and stuff
		if($one eq $two) {

		}
		else {
			$curWordCounter++;
		}
	}
	if($curWordCounter<=$minCount) {
		push @locations, $i;
	}
}
#reverses the list and prints out
@locations = reverse(@locations);
my $outS = "";
while(@locations) {
	my $thisS = pop @locations;
	$outS = $outS . $thisS . " ";
}
$outS = substr $outS,0,-1;
#prints counter at end
print $outS,"\n";
print "\n";