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
    
    "$Name=$Value" | Out-File -Path $env:GITHUB_ENV -Encoding utf8 -Append
}