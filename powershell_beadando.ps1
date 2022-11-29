# Változók deklarálása
$noEroszak="";
$sumSecurity=0;
$max=0;
$maxEroszak="";

# Fájl beolvasása
$lines = cat munkahelyi_eroszak.txt;

# Loop minden egyes sorra
foreach($line in $lines)
{
    # Komponensek beolvasása
    $nev=$line.Split(",")[0];
    $cim=$line.Split(",")[1];
    $szam=[int]$line.Split(",")[2];
    $security=[int]$line.Split(",")[3];

    # Erőszakmentes munkahely?
    if ($szam -eq 0)
    {
        $noEroszak+= "$nev,";
    }

    $sumSecurity+=$security;    # Biztonsági őrök összeszámlálása

    # Legerőszakosabb munkahely? (Nagyobb vagy egyenlő...)
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

# Eredmények kiírása

echo "`nEroszakmentes munkahely(ek):";
if ($noEroszak) 
{
    echo $noEroszak;
} 
else 
{
    echo "NINCS";
}

echo "`nBiztonsagi orok szama osszesen:";
echo $sumSecurity;

echo "`nLegeroszakosabb munkahely(ek):";
echo $maxEroszak;
