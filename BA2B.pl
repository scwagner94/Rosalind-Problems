#!/usr/bin/perl
#Sean Wagner
#BA2B.pl
#this program finds median string

my @dna = qw( TGATGATAACGTGACGGGACTCAGCGGCGATGAAGGATGAGT CAGCGACAGACAATTTCAATAATATCCGCGGTAAGCGGCGTA TGCAGAGGTTGGTAACGCCGGCGACTCGGAGAGCTTTTCGCT TTTGTCATGAACTCAGATACCATAGAGCACCGGCGAGACTCA ACTGGGACTTCACATTAGGTTGAACCGCGAGCCAGGTGGGTG TTGCGGACGGGATACTCAATAACTAAGGTAGTTCAGCTGCGA TGGGAGGACACACATTTTCTTACCTCTTCCCAGCGAGATGGC GAAAAAACCTATAAAGTCCACTCTTTGCGGCGGCGAGCCATA CCACGTCCGTTACTCCGTCGCCGTCAGCGATAATGGGATGAG CCAAAGCTGCGAAATAACCATACTCTGCTCAGGAGCCCGATG ); 
#qw( AAATTGACGCAT GACGACCACGTT CGTCAGCGCCTG GCTGAGCACCGG AGTACGGGACAG );
#qw( TGATGATAACGTGACGGGACTCAGCGGCGATGAAGGATGAGT CAGCGACAGACAATTTCAATAATATCCGCGGTAAGCGGCGTA TGCAGAGGTTGGTAACGCCGGCGACTCGGAGAGCTTTTCGCT TTTGTCATGAACTCAGATACCATAGAGCACCGGCGAGACTCA ACTGGGACTTCACATTAGGTTGAACCGCGAGCCAGGTGGGTG TTGCGGACGGGATACTCAATAACTAAGGTAGTTCAGCTGCGA TGGGAGGACACACATTTTCTTACCTCTTCCCAGCGAGATGGC GAAAAAACCTATAAAGTCCACTCTTTGCGGCGGCGAGCCATA CCACGTCCGTTACTCCGTCGCCGTCAGCGATAATGGGATGAG CCAAAGCTGCGAAATAACCATACTCTGCTCAGGAGCCCGATG );
my @patterns;
my $numDNA = scalar @dna; 
my $k = 6;
my $minHam = 99999999; #this is hard set to a really high number

my @possibilities; #total num of kmers
get_kmers("",$k,\@possibilities); #recursively gets the kmers
@possibilities = reverse(@possibilities); #puts in sorted order

while(@possibilities) {
	$currentPattern  = pop @possibilities;
	my $countOfDNAFound = 0;
	my $overallHam = 0;
	for(my $m=0;$m<$numDNA;$m++) { #for every string of dna
		$dnaToCheckAgainst = $dna[$m];
		my $currentStringMinHam = length($dnaToCheckAgainst);
		my $currentStringMinPattern = "";
		my $runToLen = length($dnaToCheckAgainst) - $k;
		for(my $n = 0; $n <= $runToLen; $n++) { #for every pattern within that, check hamming distance
			$patternToCheck = substr $dnaToCheckAgainst,$n,$k;
			#print $currentPattern,"  ",$patternToCheck,"\n";
			my $hamming = get_ham($currentPattern,$patternToCheck);
			#print $hamming,"\n";
			if($hamming<=$currentStringMinHam) { #only saves the min hamming distance
				$currentStringMinHam = $hamming;
			}
		}
		$overallHam += $currentStringMinHam;
	}
	if($overallHam<=$minHam) { #replaces and stores in overall ham to keep patterns
		if($overallHam == $minHam) {
			push @patterns, $currentPattern;
		}
		else {
			while(@patterns) { #empties list 
				my $throwAway = pop @patterns;
			}
			push @patterns, $currentPattern;
			$minHam = $overallHam; #stores back in overall
			print $overallHam,"\n",$currentPattern,"\n\n"; 
		}
	}
}
print "\n\n\n";
@patterns = reverse(@patterns); #prints list
while (@patterns) {
	my $outputPattern = pop @patterns;
	print $outputPattern," ";
}
print "\n\n\n\n";
#for every string, go trhough and grab patterns of k length
	#once pattern is grabbed, then
	#for every dna string in dna
		#check if pattern is equal to or within distance of the current grabbed location
		#if it is, check if it is in patterns
			#if not, add it to patterns and print out


#gets hamming distance between two strings
sub get_ham {
	my $dna = shift; #string 1 param
	my $other = shift; #string 2 param
	my $counter = 0;
	my @s1list;
	my @s2list;
	#splits the strings and loads to arrays
	for my $curChar (split //, $dna) {
		push @s1list, $curChar;
	}
	for my $curChar1 (split //, $other) {
		push @s2list, $curChar1;
	}
	#iterates through the lists, counts the number of differences
	while(@s1list) {
		my $one = pop @s1list;
		my $two = pop @s2list;
		if($one eq $two) {

		}
		else {
			$counter++;
		}
	}
	return $counter; #returns hamming distance
}

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