##Usage: perl replace_fasta.name.pl prot.fa desc.txt > prot.genename.replace.fa
#Example of desc file
#IB510	AZL006520	Chr	731795	732130	-	nitrogen fixation protein NifW	NifW
#IB510	AZL006550	Chr	734295	735515	-	cysteine desulfurase NifS	NifS
#IB510	AZL006560	Chr	735531	736454	-	nitrogen fixation protein NifU	NifU

open seq_file, $ARGV[0] or die$!;
open des_file, $ARGV[1] or die$!;
@des=<des_file>;
while(<seq_file>){
		 $x=$x.$_;
	}
@seq=split />/,$x;
shift(@seq);
foreach $i(@seq)
	{ @header_seq= split/\n/,$i;
	#   print "$header_seq[0]\n";
	foreach $j(@des)
		{ @des_data= split/\t/,$j;
		if($header_seq[0] eq $des_data[1])
			{ chomp(); print ">$header_seq[0].$des_data[-1]";
			  print "$header_seq[1]\n";
			}
		}
	}
