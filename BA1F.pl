#!/usr/bin/perl
#Sean Wagner
#BA1F.pl
#finds locations that minimize skew
use	strict;			
use	warnings;

#takes an input file name of ba1f.txt
open FILE, "ba1f.txt" or die $!;
my $string = ""; #main string to load
while(<FILE>) {
	if($_ eq "") {
		last; #breaks out if necessary
	}
	$string = $_; #gets the string, removes newline char
	$string =~ s/\n//g
}

my $currentLoc = 1;
my $lowest = 0;
my $counter = 0;
my $outputS = "";
for my $curChar (split //, $string) {
	if($curChar eq "\n"){ next; }
	if($curChar eq "C"){ $counter--; }
	if($curChar eq "G"){ $counter++; }
	if($counter <= $lowest) {
		if($counter < $lowest) {
			$lowest = $counter;
			$outputS = $currentLoc . " ";
		}
		elsif ($counter == $lowest) {
			$outputS = $outputS . $currentLoc . " ";
		}
	}
	$currentLoc++;
}
$outputS = substr $outputS,0,-1;
print $outputS;
print "\n";