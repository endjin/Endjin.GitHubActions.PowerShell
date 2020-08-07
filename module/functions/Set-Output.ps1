function Set-Output
{
    <#
        .SYNOPSIS
            Sets an action's output parameter.
        .EXAMPLE
            Set-Output -Name foo -Value bar
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $Name,

        [Parameter(Mandatory=$true)]
        [string]
        $Value
    )
    
    Write-Output ("`n::set-output name={0}::{1}" -f $Name, $Value)
}