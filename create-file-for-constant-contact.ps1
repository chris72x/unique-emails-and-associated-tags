$file1 = "C:\<your path here>\book1.csv"
$file2 = "C:\<your path here>\book2.csv"
$file3 = "C:\<your path here>\book3.csv"
$exportPath = "C:\<your path here>\book4.csv"


# Import files
$csv1 = Import-Csv $file1
$csv2 = Import-Csv $file2
$csv3 = Import-Csv $file3


# Create array of all email addresses
$emailArray = @()

foreach ($_ in $csv1) {$emailArray += $_.email}
foreach ($_ in $csv2) {$emailArray += $_.email}
foreach ($_ in $csv3) {$emailArray += $_.email}

# Keep only unique email addresses
$emailArray = ($emailArray | Select-Object -Unique)

# Compare Array and CSVs and create tags
$objectArray = @()


foreach ($address in $emailArray) {
    
    foreach ($record in $csv1) {
        
        if ($address -eq $record.email) {
            if ($address -in $objectArray.email) {

                $index = $objectArray.email.IndexOf($address)

                if ($objectArray[$index].tags -notmatch $record.grade) {
                    #add grade to tags
                    $objectArray[$index].tags = $objectArray[$index].tags + ", " + $record.grade
                } else {}
                if ($objectArray[$index].tags -notmatch $record.school) {
                    #add school to tags
                    $objectArray[$index].tags = $objectArray[$index].tags + ", " + $record.school
                } else {}

            } else {

                $a = "" | select email, tags
                $a.email = $address
                $a.tags = $record.grade + ", " + $record.school
                
                $objectArray += $a

            }
        } else {}
        
    }

    foreach ($record in $csv2) {
        
        if ($address -eq $record.email) {
            if ($address -in $objectArray.email) {

                $index = $objectArray.email.IndexOf($address)

                if ($objectArray[$index].tags -notmatch $record.grade) {
                    #add grade to tags
                    $objectArray[$index].tags = $objectArray[$index].tags + ", " + $record.grade
                } else {}
                if ($objectArray[$index].tags -notmatch $record.school) {
                    #add school to tags
                    $objectArray[$index].tags = $objectArray[$index].tags + ", " + $record.school
                } else {}

            } else {

                $a = "" | select email, tags
                $a.email = $address
                $a.tags = $record.grade + ", " + $record.school
                
                $objectArray += $a

            }
        } else {}
        
    }
        foreach ($record in $csv3) {
        
        if ($address -eq $record.email) {
            if ($address -in $objectArray.email) {

                $index = $objectArray.email.IndexOf($address)

                if ($objectArray[$index].tags -notmatch $record.grade) {
                    #add grade to tags
                    $objectArray[$index].tags = $objectArray[$index].tags + ", " + $record.grade
                } else {}
                if ($objectArray[$index].tags -notmatch $record.school) {
                    #add school to tags
                    $objectArray[$index].tags = $objectArray[$index].tags + ", " + $record.school
                } else {}

            } else {

                $a = "" | select email, tags
                $a.email = $address
                $a.tags = $record.grade + ", " + $record.school
                
                $objectArray += $a

            }
        } else {}
        
    }
}

$objectArray | Export-Csv -Path $exportPath -NoTypeInformation
