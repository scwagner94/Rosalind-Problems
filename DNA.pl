#Sean Wagner
#takes in a DNA string, and counts the number of each nucleotide

$a = 0;
$c = 0;
$g = 0;
$t = 0;

$inputString = "ACGT";

for my $curChar (split //, $inputString) {
   if($curChar eq "A"){ $a++; }
   if($curChar eq "C"){ $c++; }
   if($curChar eq "G"){ $g++; }
   if($curChar eq "T"){ $t++; }
}
print $a," ",$c," ",$g," ",$t,"\n\n";
