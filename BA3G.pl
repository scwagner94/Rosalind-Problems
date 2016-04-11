#!/usr/bin/perl
#Sean Wagner
#BA3G.pl
#finds a Eulerian path for a graph given properly formatted input

use	strict;
#use	warnings;
use Data::Dumper qw(Dumper);

#main graph
my @graph;
#input list
my $inputS = "0 -> 2;1 -> 3;2 -> 1;3 -> 0,4;6 -> 3,7;7 -> 8;8 -> 9;9 -> 6";
my @masterInputArr = split /;/,$inputS;
my @listOfTrapNodes;
#NOW TO ACTUALLY LOAD THE GRAPH
while(@masterInputArr) {
  my $currentLine = pop @masterInputArr;
  #break based on '->'
  my @lineArr = split / -> /,$currentLine;
  my $originNode = $lineArr[0];
  my $destList = $lineArr[1];
  #break based on comma
  my @destinationArr = split /,/,$destList;
  #print $originNode,":  ",scalar @destinationArr,"\n";
  $graph[$originNode] = \@destinationArr;
}
for(my $i = 0; $i < scalar @graph; $i++) {
  if(defined $graph[$i]) {
    #uhh
  }
  else {
    #i am aware of how ugly this code is
    my @emptyList = ();
    $graph[$i] = \@emptyList;
    push @listOfTrapNodes, $i;
  }
}
#print Dumper @graph;
for(my $i = 0; $i < scalar @graph; $i++) {
  #this goes through and just shows me the graph setup
  my $tempRef = $graph[$i];
  print $i,":  ";
  my @currArr = @$tempRef;
  for(my $j; $j < scalar @currArr; $j++) {
    print $currArr[$j],",";
  }
  print "\n";
}
#AT THIS POINT, THE GRAPH IS LOADED INTO MATRIX PROPERLY
#now to determine how to find the path
#need to keep track of path and to visit
#adopted algorithm from popular Hierholzer algorithm
print "\n\n\n";
my @allPaths; #storage for results
my $longestResult = 0; #for printing only relevant solutions
for(my $z = 0; $z < scalar @graph; $z++) {
  my @newGraph = @graph;#first need to copy the graph to new graph
  for(my $l = 0; $l < scalar @newGraph; $l++) {
    my @arr = @{@newGraph[$l]};
    my @newArr = @arr;
    $newGraph[$l] = \@newArr;
  }
  my @next; #list of possible places to go in backtrack situations
  my @result; #the route taken
  my $currentNode = $z; #start at all possible nodes
  #print scalar @{@graph[$currentNode]},"\n";
  while((scalar @next > 0) || ((scalar @{@newGraph[$currentNode]})>0)){
    my $numOptions = scalar @{@newGraph[$currentNode]};
    #if it has options, then explore those
    if($numOptions > 0){
      push @next, $currentNode;
      my $newNodeToGo = pop @{@newGraph[$currentNode]};
      $currentNode = $newNodeToGo;
    }
    #otherwise, we can add this to path and keep going
    elsif (scalar @next > 0){
      push @result,$currentNode;
      $currentNode = pop @next;
    }
  }
  #store the results
  push @result,$currentNode;
  my $printS = "";
  #get it formatted to print
  while(@result) {
    $printS = $printS . (pop @result) . "->";
  }
  $printS = substr($printS,0,-2);
  #make sure that we keep track of longest solution
  if(length($printS)>$longestResult) {
    $longestResult = length($printS);
  }
  push @allPaths, $printS;
}
#sort the output
@allPaths = reverse(sort(@allPaths));
while(@allPaths) {
  #go through and print the relevant ones
  my $currentString = pop @allPaths;
  if(length($currentString) < $longestResult) {
    next;
  }
  #finish printing
  print "\n",$currentString,"\n";
}
print "\n\n\n";
