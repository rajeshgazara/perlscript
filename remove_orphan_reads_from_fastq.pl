###usage perl file.pl pair.1.fastq pair2.fastq pair1.common.fastq pair2.common.fastq
open F1,"$ARGV[0]" or die $!;   ### pair1
open F2,"$ARGV[1]" or die $!;   ### pair2
open F3,">$ARGV[2]" or die $!;  ### pair1 comman reads
open F4,">$ARGV[3]" or die $!;  ### pair2 comman reads
$count =0;
while(<F1>)
                { $count++;
                  if($count == 1)
                        { chomp; undef@header1; $a = $_; @header1= split /\s+/,$_; }
                  if($count == 2)
                        {chomp; $b =$_; }
                  if($count == 3)
                        {chomp; $c = $_; }
                  if($count == 4)
                         { chomp; $d =$_; $count =0; if($b ne ''){  $hash{$header1[0]} ="$a\n$b\n$c\n$d";} }
print "scanning complete !!!!!! \n Data printing initialize !!!!\n";
                }
$count =0;
while(<F2>)
                { $count++;
                        if($count ==1)
                                { chomp; undef@header2; $p = $_; @header2= split /\s+/,$_;}
                        if($count ==2)
                                { chomp; $q =$_; }
                        if($count == 3)
                                { chomp; $r = $_; }
                        if($count == 4)
                                { chomp; $s =$_; $count = 0;
                                        if($q ne '')
                                        {
                                                  if($hash{$header2[0]})
                                                        {
                                                          print F3 "$hash{$header2[0]}\n";
                                                          print F4 "$p\n$q\n$r\n$s\n";
                                                        }

                                        }
			        }
		}
