#!/usr/bin/perl
#Sean Wagner
#BA1M.pl
#implements number to pattern
use	strict;			
use	warnings;

my $dna = "";
my @codons = qw(A C G T);
my $count = 8046;
my $k = 8;
$k = $k - 1;
#begins value calculation
my $position = 0;
#counts up to number of positions
while ($k >= 0) {
	my $posVal = (4**$k);
	my $maxValSub = 0;
	my $currentLetterSelect = 0;
	#finds the max value that can be remoevd from count
	for(my $j = 0; $j < 4; $j++) {
		my $tempVal = $j * $posVal;
		#overwrites if larger
		if ($tempVal <= $count) {
			$maxValSub = $tempVal;
			$currentLetterSelect = $j;
		}
	}
	#decrements count and updates dna string
	$count = $count - $maxValSub;
	$dna = $dna . $codons[$currentLetterSelect];
	$k = $k - 1;
}
#should never have this happen
if($count!=0) {
	print "ERROR AHHH\n";
}
#outputs results
print $dna,"\n\n";