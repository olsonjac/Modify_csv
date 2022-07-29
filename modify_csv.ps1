$inputfilepath="C:\Users\olson\OneDrive\Documents\Ingest\*.csv"
$date = (Get-Date -Format "yyyy.MM.dd_hhmm_tt")
$destinationfilepath="C:\Users\olson\OneDrive\Documents\Ingest\temp\new$date"
$names=Import-Csv -Path $inputfilepath



foreach($name in $names){
    $newname="$($name.AssetName) $($name.Type)"
    
    Add-Member -InputObject $name -MemberType NoteProperty -Name "newname" -Value $newname
    
}

$names | Export-Csv -Path $destinationfilepath -NoTypeInformation