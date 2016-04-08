#Sean Wagner
#takes in a number of DNA sequences, finds the GC content in each
#prints the sequence with the highest quantity of GC

$numEntries = 0;
$dnaIn = "";
$currentRosName = "";
@listOfNames;
@listOfDNA;
#read in entries here properly, store in arrays
while(7) {
	print "\nPlease input a title: ";
	$inputString = <STDIN>;
	#break loop here
	if (index($inputString, "q") != -1) {
		push @listOfNames, $currentRosName;
		push @listOfDNA, $dnaIn;
		last;
	}
	#starter string here
	elsif (index($inputString, ">") != -1) {
		if($numEntries>0) {
			push @listOfNames, $currentRosName;
			push @listOfDNA, $dnaIn;
		}
		$numEntries++;
		$currentRosName = $inputString;
		$dnaIn = "";
	}
	#append to current string line is here
	else {
		$dnaIn = $dnaIn . $inputString;
	}
}

#go through entries and count gc content
$bestName = "";
$bestContent = 0.0;
$loopVar = $numEntries;
for (my $i=0; $i < $loopVar; $i++) {
	$currentName = pop @listOfNames;
	$currentDNA = pop @listOfDNA;
	$totalLen = 0;
	$c = 0;
	$g = 0;
	#splits and counts the GC content
	for my $curChar (split //, $currentDNA) {
	   if($curChar eq "\n"){ next; }
	   if($curChar eq "C"){ $c++; }
	   if($curChar eq "G"){ $g++; }
	   $totalLen++;
	}
	
	#print "\n",$c,"\n",$g,"\n\n";
	#print $totalLen,"\n";
	$cgContent = (($c+$g)/$totalLen)*100.0;
	print "\n|",$currentName,"|",$cgContent,"|\n";
	#print "\n",$currentName,"\n";
	#print $cgContent,"\n";
	#loads in best gc content to stored var
	if($cgContent>$bestContent) {
		$bestName = $currentName;
		$bestContent = $cgContent;
	}
}


#print the winner
print "\n",$bestName,"\n";
print "\n",$bestContent,"\n\n\n";
