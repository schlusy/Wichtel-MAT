function Get-RandomWichtelAssignment {
    param (
        [array]$participants,
        [array]$couples = @()
    )

    $wichtelParticipants = $participants.Clone()

    do {
        $shuffledParticipants = $wichtelParticipants | Get-Random -Count $participants.Count

        $isValid = $true
        $wichtelAssignment = @{}
        for ($i = 0; $i -lt $participants.Count; $i++) {
            $gifter = $participants[$i]
            $presentee = $shuffledParticipants[$i]
            
            # import couples or other exclude combinations from input file "excluding.txt"
            # unwanted combinations (2 names) are noted as "Person1 & Person2"
            if ($couples -contains "$gifter & $presentee" -or $couples -contains "$presentee & $gifter") {
                $isValid = $false
                break
            }

            $wichtelAssignment[$gifter] = $presentee

            if ($gifter -eq $presentee) {
                $isValid = $false
                break
            }
        }
    }
    while (!$isValid)

    return $wichtelAssignment
}

# import participants via inputfile "participants.txt" 
$participants = Get-Content -Path "input/participants.txt"

# import couples or or other excludes combinations via inputfile "excluding.txt"
$couples = Get-Content -Path "input/excluding.txt"

$assignment = Get-RandomWichtelAssignment -participants $participants -couples $couples

foreach ($gifter in $assignment.Keys) {
    $presentee = $assignment[$gifter]
    Write-Host "$gifter beschenkt $presentee"
}
