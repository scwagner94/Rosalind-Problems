#!/usr/bin/perl
#Sean Wagner
#BA1K.pl
#seeks to create the frequency array for a dna string
use	strict;			
use	warnings;

my $dna = "GGCCGGTCAATGCTTTTTCATGGTCTCGCCAGCCACAGGCCCATTTTATTTAACTACAACAGCTTCGCAGTGTCGGCCAAAACCCTAGCACATCAATTGTTTAAAGATAGTTATAAGTTTGGCATCGACGCTGCTATACAATGGGGGCTCATATGCGTGTTCATTTGGGTTCGGTACTTTAGTAAAGGAATGAATATAGCCGTCTGGATGATTACTGCCATCTGAGTTGATTAACTTGTGATAAGCATGTGAGTTTGCTCCCCCAGTGTCGATTGGCCCTTACATCTCGCGAACTAGTTACAGTGTTGCAGCCTCCTTATCGTGCATTCAAAGGAGATTCCAAGAATAAGATCAAAGGCGGTAGGAAGGCATGTCTATCCAGGACGCCGTCCGGGGATACACCGCCTATTTGCTGACGTGCTCGTACTACTTACGTATTATTAAAGCAGGTGGTAATCGGAACGTTCGTATTACAAAATGTCCCTAGTTAGAGTCTTTTCTGGTCTACCCTTTTCCACCATGAACTGATGGTTCGTTCAATAGAAGCGTTTAGCTAGCAGGGTTGGGTAACGCGCACACCTCGACCTAGTTTATTCCCTCCCGGACCGCTACCATCAGCTGGTAAAGACCACCAGGGCTTCGAAGGTTAATGCG";
print "Please input a k: ";
my $k = <STDIN>;
my @possibilities; #total num of kmers
get_kmers("",$k,\@possibilities); #recursively gets the kmers
@possibilities = reverse(@possibilities); #puts in sorted order
while(@possibilities) {
	my $currentString = pop @possibilities; 
	#checks all possible substrings and counts
	my $number = 0;
	for(my $i = 0; $i<=length($dna);$i++) {
		my $newSub = substr $dna,$i,$k;
		if($newSub eq $currentString) {
			$number++;
		}
	}
	#prints results
	print $number," ";
}
print "\n\n";




#generate the number of k-mers recursively 
sub get_kmers {
	#(currentString,desiredLen,outputList) 
	my $currentString = shift;
	my $desiredLen = shift;
	my $outputList = shift; #unload params
	if(length($currentString) == $desiredLen) {
		#if is base case, add to array of kmers
		push $outputList,$currentString;
		return;
	}
	else {
		#if not base case, recursively call and add to string
		get_kmers($currentString."A",$desiredLen,$outputList);
		get_kmers($currentString."C",$desiredLen,$outputList);
		get_kmers($currentString."G",$desiredLen,$outputList);
		get_kmers($currentString."T",$desiredLen,$outputList);
	}
}


