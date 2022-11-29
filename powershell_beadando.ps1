$noEroszak="";
$sumSecurity=0;
$max=0;
$maxEroszak="";

$lines = cat munkahelyi_eroszak.txt;
foreach($line in $lines)
{
    $nev=$line.Split(",")[0];
    $cim=$line.Split(",")[1];
    $szam=[int]$line.Split(",")[2];
    $security=[int]$line.Split(",")[3];

    if ($szam -eq 0)
    {
        $noEroszak+= "$nev,";
    }

    $sumSecurity+=$security;

    if ($szam -gt $max)
    {
        $max = $szam;
        $maxEroszak="$nev,$cim,"
    } 
    elseif ($szam -eq $max) 
    {
        $maxEroszak+="$nev,$cim,"
    }

}

echo "\nEroszakmentes munkahely(ek):";
if ($noEroszak) 
{
    echo $noEroszak;
} 
else 
{
    echo "NINCS";
}

echo "\nBiztonsagi orok szama osszesen:";
echo $sumSecurity;

echo "\nLegeroszakosabb munkahely(ek):";
echo $maxEroszak;
