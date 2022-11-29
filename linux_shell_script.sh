#!/bin/sh

file="$1"
sumsecuritystaff=0
zeroviolentdb=0
maxviolent=0

echo "1/a) Ezek a cégek nem jelentettek erőszakos cselekményt:"
while IFS=',' read -r companyname companyaddress violentincidents securitystaff
do
	((sumsecuritystaff += $securitystaff))
	if [ $violentincidents -gt $maxviolent ]
	then
		((maxviolent = $violentincidents))
	fi
	if [ $violentincidents -eq 0 ]
	then
		echo "$companyname"
		((zeroviolentdb+=1))
	fi
done < "$file"

if [ $zeroviolentdb -eq 0 ]
then
	echo "NINCS"
fi

echo "1/b) Összes biztonságiőrök száma: $sumsecuritystaff"
echo "1/c) Legtöbb erőszakos cselekményt jelentették:"

while IFS=',' read -r companyname companyaddress violentincidents securitystaff
do
	if [ $maxviolent -eq $violentincidents ]
	then
		echo "$companyname, $companyaddress"
	fi
done < "$file"
exit 0
