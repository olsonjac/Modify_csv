#initial file location using a wild card to pull any csv file present
$inputfilepath="C:\Users\olson\OneDrive\Documents\Ingest\*.csv"
#date varianble used to generate unique file names that reference time of creation
$date = (Get-Date -Format "yyyy.MM.dd_hhmm_tt")
#new csv import destination directory using that date variable
$destinationfilepath="C:\Users\olson\OneDrive\Documents\Ingest\temp\new$date"
#variable that will hold the csv file that is imported at the filepath location
$names=Import-Csv -Path $inputfilepath

#for loop that will iterate through the csv table and concatentate two of the columns into a single new column that will be added at the end
foreach($name in $names){
    $newname="$($name.AssetName) $($name.Type)"
    
    Add-Member -InputObject $name -MemberType NoteProperty -Name "newname" -Value $newname
}
#final export statement that will push the newly modified csv file to the the destination directory
$names | Export-Csv -Path $destinationfilepath -NoTypeInformation