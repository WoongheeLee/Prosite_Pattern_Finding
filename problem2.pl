#!/usr/bin/perl

$file = "swissprot_sample.fas";

open(fileHandle, $file);
chomp(@allLines = <fileHandle>);
close(fileHandle);

$temp = join "", @allLines;

print "A";
@arr = split />/, $temp;
@reg =(  
	"N[^P][ST][^P]",
	"SG[A-Z]G",
	"[RK]{2}[A-Z][ST]",
	"[ST][A-Z][RK]",
	"[ST][A-Z]{2}[DE]",
	"[RK][A-Z]{2,3}[DE][A-Z]{2,3}Y",
	"G[^EDRKHPFYW][A-Z]{2}[STAGCN][^P]",
	"[A-Z]G[RK]{2}",
	"C[A-Z][DN][A-Z]{4}[FY][A-Z]C[A-Z]C",
	"[A-Z]{12}E[A-Z]{3}E[A-Z]C[A-Z]{6}[DEN][A-Z][LIVMFY][A-Z]{9}[FYW]",
	"[DEQGSTALMKRH]][LIVMFYSTAC][GNQ][LIVMFYAG][DNEKHS]S[LIVMST][^PCFY][STAGCPQLIVMF][LIVMATN][DENQGTAKRHLM][LIVMWSTA][LIVGSTACR][A-Z]{2}[LIVMFA]"
);
@count = (0,0,0,0,0,0,0,0,0,0,0);
open FH, ">", "problem2.txt" or die "$!\n";
for($j = 0; $j <= $#reg; $j++) {
	for ($i = 0; $i <= $#arr; $i++) {
		if($count[$j]<5) {
			if($arr[$i] =~ /$reg[$j]/) {
				print FH "[",$j,"]:\t>";
				print FH $arr[$i],"\n";
				$count[$j]++;
			}
		}
	}
}

close FH
