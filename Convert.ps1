        [CmdletBinding()] Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $EXE, 
        
        [Parameter(Position = 1, Mandatory = $False)]
        [String]
        $Filename = "$pwd\Converted.txt"
    )
    [byte[]] $hexdump = get-content -encoding byte -path "$EXE"
    [System.IO.File]::WriteAllLines($Filename, ([string]$hexdump))
    Write-Output "Converted file written to $Filename"
