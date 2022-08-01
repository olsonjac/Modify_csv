#initial file location using a wild card to pull any csv file present
$inputfilepath="C:\Users\olson\OneDrive\Documents\Ingest\example.csv"
#date varianble used to generate unique file names that reference time of creation
$date = (Get-Date -Format "yyyy.MM.dd_hhmm_tt")
#new csv import destination directory using that date variable
$destinationfilepath="C:\Users\olson\OneDrive\Documents\Ingest\archive\new_file$date.xlsx"
#variable that will hold the csv file that is imported at the filepath location
$names=Import-Csv -Path $inputfilepath

#for loop that will iterate through the csv table and concatentate two of the columns into a single new column that will be added at the end
foreach($name in $names){
    $newname="$($name.AssetName) $($name.Type)"
    
    Add-Member -InputObject $name -MemberType NoteProperty -Name "Hybrid_column" -Value $newname -Force
}
#final export statement that will push the newly modified csv file to the the destination directory as an excel file format
$names | Export-Excel $destinationfilepath