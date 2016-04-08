#!/usr/bin/perl
#Sean Wagner
#BA1G.pl
#finds locations that gets the hamming distance
use	strict;			
use	warnings;

#takes an input file name of ba1f.txt
open FILE, "ba1g.txt" or die $!;
my $string1 = ""; #first string to load
my $string2 = ""; #second string to load
while(<FILE>) {
	if($_ eq "") {
		last; #breaks out if necessary
	}
	if($string1 eq "") {
		$string1 = $_; #gets the string, removes newline char
		$string1 =~ s/\n//g
	}
	else {
		$string2 = $_; #gets the string, removes newline char
		$string2 =~ s/\n//g
	}
}
my $counter = 0;
my @s1list;
my @s2list;
for my $curChar (split //, $string1) {
	push @s1list, $curChar;
}
for my $curChar1 (split //, $string2) {
	push @s2list, $curChar1;
}

while(@s1list) {
	my $one = pop @s1list;
	my $two = pop @s2list;
	if($one eq $two) {

	}
	else {
		$counter++;
	}
}

print $counter;
print "\n";