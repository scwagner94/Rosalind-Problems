#!/usr/bin/perl
#Sean Wagner
#BA1L.pl
#implements pattern to number
use	strict;			
use	warnings;

my $dna = "GGTGGTCAGTATGCGCTGTAAAAGT"; #input string
$dna = reverse($dna);

#begins value calculation
my $total = 0;
my $position = 0;
#splits string for calc
for my $curChar (split //, $dna) {
	my $value = 0;
	#gets value of the character
	if($curChar eq "A") {
		$value = 0;
	}
	elsif ($curChar eq "C") {
		$value = 1;
	}
	elsif ($curChar eq "G") {
		$value = 2;
	}
	elsif ($curChar eq "T") {
		$value = 3;
	}
	else {
		print "FAILED AHHHHH\n\n";
	}
	#figures out how much to add to total
	my $addVal = (4**$position)*$value;
	$total = $total + $addVal;
	$position++;
}
#outputs results
print $total,"\n\n";