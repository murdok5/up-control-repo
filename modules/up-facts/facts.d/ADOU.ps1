
    $ComputerName = $env:computername
    $Filter = "(&(objectCategory=Computer)(Name=$ComputerName))"

    $DirectorySearcher = New-Object System.DirectoryServices.DirectorySearcher
    $DirectorySearcher.Filter = $Filter
    $SearcherPath = $DirectorySearcher.FindOne()
    $DistinguishedName = $SearcherPath.GetDirectoryEntry().DistinguishedName

    $OUName = ($DistinguishedName -Split (","))[1]
    $OUMainName = $OUName.SubString($OUName.IndexOf("=")+1)

    write-host "ADOU = $OUMainName"
