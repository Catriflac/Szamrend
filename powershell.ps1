for ($num = 1 ; $num -le 10 ; $num++)      #for ciklus
{    
    "I count $num"
}


#############################
$filename = "__tmp.txt"             #változó deklarálás
$szo = Read-Host "Add meg a szot"
#$szo
while ($szo -ne "vege")             #while ciklus
{
    $szo >>__tmp.txt                    #fájlbaírás
    $szo = Read-Host "Add meg a szot"
}
if(Get-Item -Path "__tmp.txt" -ErrorAction Ignore)  #létezik a fájl?
{
    Write-Host "File Exists"        #igen
    cat $filename | sort            #rendezés
    rm $filename                    #akkor töröljük
}


#############################
[int]$szamFile = cat szam       #egy szám beolvasása
$szamFile + $szamFile           #érték növelése és kiírás


#############################
"`tHello "                      #táblázatkészítés
Write-Output "x`tx**2`tx**3"
for ($x=0; $x -le 10; $x++)
{
    $x2=$x*$x;
    $x3=$x*$x*$x;
    #
    Write-Output $x`t$x2`t$x3;
}




$colors = @("Green","Cyan","Red","Magenta","Yellow","White")
for (($x=''),($fgcolor = $colors | Get-Random) ;$x.length -le 30;($x=$x+'x'),($fgcolor = $colors | Get-Random)){
    Write-Host $x -ForegroundColor $fgcolor
    Start-Sleep -Milliseconds 20
}
