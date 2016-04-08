#!/usr/bin/perl
#Sean Wagner
#cons.pl
#problem from rosalind, solves consensus string and matrix for dna
use warnings;
use strict;

my @dnaTides = qw( A C G T );
#takes in input file name
my $fileName = "dna.txt";

#stores lines in array
my @dnaLines;
open FILE, $fileName or die $!;
while(<FILE>) {
	my $fileLine = $_;
	chomp($fileLine); #cleans up the line a bit
	push @dnaLines,$fileLine; #adds to array
}
#gets length of dna strings
my $lenOfDna = length($dnaLines[0]);
#gets number of dna strings
my $runLoopLen = scalar @dnaLines;
#makes arrays to hold counts
my @a = (0) x $lenOfDna;
my @c = (0) x $lenOfDna;
my @g = (0) x $lenOfDna;
my @t = (0) x $lenOfDna;
#runs through every dna string
for(my $i = 0; $i < $runLoopLen; $i++) {
	my $curDNA = pop @dnaLines;
	my $currentCharNum = 0;
	#splits out by character to process
	for my $curChar (split //, $curDNA) {
		#adds and tallys proper character
		if($curChar eq "A") {
			$a[$currentCharNum] += 1;
		}
		elsif($curChar eq "C"){ 
			$c[$currentCharNum] += 1;
		}
		elsif($curChar eq "G"){ 
			$g[$currentCharNum] += 1; 
		}
		elsif($curChar eq "T"){ 
			$t[$currentCharNum] += 1; 
		}
		else{
		}
		$currentCharNum++;
	}
}
#formats the consensus string here
my $consensus = "";
for(my $i = 0; $i < $lenOfDna; $i++) {
	#holds the current counts in here
	my $curA = $a[$i];
	my $curC = $c[$i];
	my $curG = $g[$i];
	my $curT = $t[$i];
	#checks to see greatest total to form string
	my $greatestInt = 0;
	my $greatest = 0;
	if($curA>$greatestInt) {
		$greatest = 0;
		$greatestInt = $curA;
	}	
	if ($curC>$greatestInt) {
		$greatest = 1;
		$greatestInt = $curC;
	}
	if ($curG>$greatestInt) {
		$greatest = 2;
		$greatestInt = $curG;
	}
	if ($curT>$greatestInt) {
		$greatest = 3;
		$greatestInt = $curT;
	}
	#appends best character
	$consensus = $consensus . $dnaTides[$greatest];
}
#formats output strings
my $aOut = "A: ";
my $cOut = "C: ";
my $gOut = "G: ";
my $tOut = "T: ";
#ensures printing in proper order
@a = reverse(@a);
@c = reverse(@c);
@g = reverse(@g);
@t = reverse(@t);
#appeands and creates the output matrix
for(my $i = 0; $i <= $lenOfDna; $i++) {
	$aOut = $aOut . (pop @a) . " ";
	$cOut = $cOut . (pop @c) . " ";
	$gOut = $gOut . (pop @g) . " ";
	$tOut = $tOut . (pop @t) . " ";
}
#prints results out
print "\n\n",$consensus,"\n\n";
print $aOut,"\n";
print $cOut,"\n";
print $gOut,"\n";
print $tOut,"\n\n\n";
