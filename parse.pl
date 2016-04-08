#!/usr/bin/perl
#Sean Wagner
#parse.pl
#problem from lab 7
#this reads in some stuff and counts occurances of words
#also cleans it up

use warnings;
use strict; 

print "Please input a file name to copy: ";
#takes in input file name
my $fileName = "ulysses.txt";
print "\n";
#appends copy to file name

my %storage;
#reads each line of original file in
open FILE, $fileName or die $!;
while(<FILE>) {
	my $fileLine = $_;
	chomp($fileLine);
	#cleans up the line a bit
	for my $curString (split / /, $fileLine) {
		#for every word in the line
		my $fixedString = lc $curString;
		#removes a bunch of bad characters
		$fixedString =~ s/(\W)+//;
		$fixedString =~ s/(\_)+//;
		$fixedString =~ s/(\,)+//;
		$fixedString =~ s/(\s)+//;
		$fixedString =~ s/(\!)+//;
		$fixedString =~ s/(\.)+//;
		$fixedString =~ s/(\?)+//;
		$fixedString =~ s/(\')+//;
		#checks if in hash, and updates value or adds it
		if(exists $storage{$fixedString}){
			$storage{$fixedString} = $storage{$fixedString} + 1;
		}
		else {
			$storage{$fixedString} = 1;
		}
	}
}

#sorts the list fast by using keys
my @keys = keys %storage;
@keys = sort(@keys);
@keys = reverse(@keys);
my $j = 0;
#prints the output
while(@keys) {
	my $curKey = pop @keys;
	if($j == 0) {
		$j++;
	}
	else {
		print $curKey," - ",$storage{$curKey},"\n";
	}
}