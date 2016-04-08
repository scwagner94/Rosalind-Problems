#!/usr/bin/perl
#Sean Wagner
#BA2A.pl
#this program finds a distance of patterns to strings

my @dna = qw( ATTTGGC TGCCTTA CGGTATC GAAAATT );
my @patterns;
my $numDNA = scalar @dna; 
my $k = 3;
my $d = 1;
my @possibilities; #total num of kmers
get_kmers("",$k,\@possibilities); #recursively gets the kmers
@possibilities = reverse(@possibilities); #puts in sorted order

while(@possibilities) {
	$currentPattern  = pop @possibilities;
	$currentDNA = $dna[$i];
	my $countOfDNAFound = 0;
	for(my $m=0;$m<$numDNA;$m++) { #for every string of dna
		$dnaToCheckAgainst = $dna[$m];
		my $runToLen = length($dnaToCheckAgainst) - $k;
		for(my $n = 0; $n <= $runToLen; $n++) { #for every pattern within that, check hamming distance
			$patternToCheck = substr $dnaToCheckAgainst,$n,$k;
			#print $currentPattern,"  ",$patternToCheck,"\n";
			my $hamming = get_ham($currentPattern,$patternToCheck); #this gets ham
			#print $hamming,"\n";
			if($hamming <= $d) { #coutns the locations found
				#print "MATCH: ",$currentPattern," ",$patternToCheck,"\n";
				$countOfDNAFound++;
				last;
			}
		}
	}
	if($countOfDNAFound == $numDNA) {
		push @patterns, $currentPattern;
	}
}
print "\n\n\n";
@patterns = reverse(@patterns); #this reverses order and then prints
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