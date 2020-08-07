function Get-Input
{
    <#
        .SYNOPSIS
            Reads an action's input parameter.
        .EXAMPLE
            Get-Input -Name foo
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $Name
    )
    
    [System.Environment]::GetEnvironmentVariable("INPUT_$Name")
}