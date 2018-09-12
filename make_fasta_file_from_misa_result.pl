############### fetch sequences in fasta format from misa output ######################
#################################################################
############### RAJESH KUMAR GAZARA #############################
#################################################################
#####input file = misa output file#####################################################
#####output in fasta format ###########################################################
#>123
#ATGCGATACGTAGCAGATGCGAC

##usage: perl script.pl file.misa > output.fasta

#!usr/bin/perl 
open file,"$ARGV[0]" or die$!;
while(<file>)
	{ if ($_ !~ /^ID/)
	  {	@a= split /\t/,$_;	
	  @a1= split /\)|\(/,$a[3];
	shift(@a1);	  
	#print "$a1[0]\t$a1[1]\t$a1[2]\t$a1[3]\t$a1[4]\t$a1[5]\n";
	
$r='';
for ($i=0; $i <$#a1; $i++)
	{
	if ($i%2==0)
	{   
	$x=$a1[$i+1];
	$x=~ s/([A-Z]|[a-z])//g;	
	$y=$a1[$i];
	$y=~ s/[1-9]//g;
	$z=$y x $x;
	#print "$z\t";
	$r=$r.$z;
	}
	else
	{
	$y=$a1[$i];
	$y=~ s/[1-9]//g;
	$z1=$y;
	#print "$z1\n";	
	$r=$r.$z1;
	}
	}print ">$a[0]\n$r\n";
	}}
