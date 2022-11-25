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
    
    Write-Output "$Name=$Value" | Out-File -FilePath $env:GITHUB_OUTPUT -Encoding ascii -Append
}