#Sean Wagner
#Rabbits problem from rosalind
#takes in n and k and calculates the population

#reads in n and k
print "Please input a value for N: ";
$n = <STDIN>;
print "\nPlease input a value for K: ";
$k = <STDIN>;
print "\n";
#does error checking on generations
if($n>40) {
	print "\nFAILED, cannot be that small for N.\n";
}
elsif($k>5) {
	print "\nFAILED, cannot be that small for K.\n";
}
#calculates the population size
else {
	#keeps track of rabits, prev generation, and 2nd generation
	$currentRabs = 1;
	$generation = 1;
	$prevGenRabits = 0;
	$twoGenRabits = 0;
	while($generation<=$n) {
		#executes for num times of generations
		$currentRabs += $twoGenRabits * $k;
		$twoGenRabits = $prevGenRabits;
		if($prevGenRabits==0) {
			$prevGenRabits = 1;
		}
		else {
			$prevGenRabits = $currentRabs;
		}
		$generation++;
	}
}
#prints the answer
print "\n",$currentRabs,"\n\n";