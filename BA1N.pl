#!/usr/bin/perl
#Sean Wagner
#BA1N.pl
#generates all patterns that have hamming distance of input


my $dna = "CCGCACGTCG";
print "Please input a k: ";
my $k = <STDIN>;
my $len = length($dna);

my @possibilities; #total num of kmers
get_kmers("",$len,\@possibilities); #recursively gets the kmers
@possibilities = reverse(@possibilities); #puts in sorted order
my @output;

while(@possibilities) {
	#unloads string and checks hamming
	my $currentString = pop @possibilities;
	my $hamming = get_ham($dna,$currentString);
	if($hamming == $k) { #adds to output if correct distance
		push @output,$currentString;
	}
}
#prints the results
while(@output) {
	my $printString = pop @output;
	print $printString, "\n";
}




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