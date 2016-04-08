#!/usr/bin/perl
#Sean Wagner
#fibd.pl
#harder rabbits problem from rosalind
#takes in n and mortality rate and calculates the population
use strict;
use warnings;
#reads in n and m
print "Please input a value for number of months: ";
my $n = <STDIN>;
print "\nPlease input a value for death: ";
my $k = <STDIN>;
print "\n";

#gets the current rabs and sets up stuff
my $currentRabs = 0;
my @rabsByGeneration;
#instantiates array to nothing
for(my $i = 0; $i < $k; $i++) {
	$rabsByGeneration[$i] = 0;
}
$rabsByGeneration[$k-1] = 0;
#goes through by generation
for(my $i = 0; $i<$n; $i++) {
	my $babies = 0;
	#calcs how many babies are born this generation
	for(my $j = 0; $j < $k-1; $j++) {
		$babies += $rabsByGeneration[$j];
	}
	#shifts everything down one index
	for(my $j = 0; $j<$k-1;$j++) {
		$rabsByGeneration[$j] = $rabsByGeneration[$j+1];
	}
	#sets up the initial birth rate
	if($i==0) {
		$babies = 1;
	}
	#stores the new amount of babies
	$rabsByGeneration[$k-1] = $babies;
}

#adds up the living rabbits
for(my $j = 0; $j < $k; $j++) {
	$currentRabs += $rabsByGeneration[$j];
}
#prints the answer
print "\n",$currentRabs,"\n\n";
