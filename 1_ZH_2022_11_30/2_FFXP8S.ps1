Write-Output "x`tsin(x)`tcos(x)"     #táblázatkészítés
for ($x=0; $x -le 1; $x+=0.1)
{
    $x2= [math]::round([Math]::Sin($x),5);
    $x3= [math]::round([Math]::Cos($x),5);
    #
    Write-Output $x`t$x2`t$x3;
}

<#
   FFXP8S
   2022.11.30.
   
   2. Irj egy scriptet ami tablazatot keszit, formazva.
        pl. 
        2_neptunkod.sh
        v.
        2_neptunkod.ps1
        x	sin(x)		cos(x)
        ...	...		...
        x=[0,1] 0.1-vel, az ertekek 5 tizedesjeggyel.
#>