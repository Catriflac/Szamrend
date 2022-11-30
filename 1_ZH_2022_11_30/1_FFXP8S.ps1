param(
    [Parameter()]
    [Int]$num
)

if ( $num -le 0 -or $num -ge 31)
{
    Write-Host "Hibas parameter!"
    Exit
}

for($i = 0; $i -le $num-1; $i++)
{ 
    for($j = 0; $j -le $i; $j++)
        { 
            Write-Host -NoNewline '*'
        }
        Write-Host
}
for($i = $num-1; $i -ge 1; $i--)
{ 
    for($j = $i; $j -ge 1; $j--)
        { 
            Write-Host -NoNewline '*'
        }
        Write-Host
}

<#
   FFXP8S
   2022.11.30.
   
    1. Irj egy scriptet 1 parameterrel,ami a parameterben 
    megadott szamu csillagot rajzol a peldaban megadott modon:
#>