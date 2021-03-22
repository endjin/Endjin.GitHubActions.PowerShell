function Export-Variable
{
    <#
        .SYNOPSIS
           Creates or updates an environment variable for any actions running next in a job. 
           The action that creates or updates the environment variable does not have access to the new value, but all subsequent actions in a job will have access. 
           Environment variables are case-sensitive and you can include punctuation.
        .EXAMPLE
            Export-Variable -Name foo Value bar
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
    
    Add-Content -Path $env:GITHUB_ENV `
                -Value ("{0}={1}" -f $Name, $Value) `
                -Encoding ascii
}