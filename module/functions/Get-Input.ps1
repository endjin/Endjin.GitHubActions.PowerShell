function Get-Input
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $Name
    )
    
    [System.Environment]::GetEnvironmentVariable("INPUT_$Name")
}