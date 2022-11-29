#!/bin/sh

#Horvath David Gyorgy
#FFXP8S
#2022.11.03

#Szukseges osszetevo: munkahelyi_eroszak.txt

awk -F , '

BEGIN {
max=0; max1=""; maxEroszak="";
print "Eroszakmentes munkahely(ek):";
}

{
    sum+=$4;				#biztonsagi orok szamlaloja
	
    if ($3==0)				#0 jelentett eroszakos incidens eseten
    {
        print $1;
        eroszakmentes="van";
    }

    if ($3>max)				#uj legtobb jelentett eset -> mentett adat felulirasa
    {
        maxEroszak="";
        max=$3;
        maxEroszak = $1 "," $2;
    }

    else if ($3==max)		#megegyezo szamu legtobb eset -> hozzafuzes
        {
            max1 = maxEroszak;
            maxEroszak = max1 "\n" $1 "," $2
        }

}

END {
    if (eroszakmentes!="van")		#ha nem volt 0 jelentett incidens
    {
        print "NINCS"
    }
    print "\nBiztonsagi orok szama osszesen: " sum;
    print "\nLegeroszakosabb intezmeny(ek) ("max " incidens):"
    print maxEroszak;

}' munkahelyi_eroszak.txt

exit
