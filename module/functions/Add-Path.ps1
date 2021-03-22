function Add-Path
{
    <#
        .SYNOPSIS
            Prepends a directory to the system PATH variable for all subsequent actions in the current job. 
            The currently running action cannot access the new path variable.
        .EXAMPLE
            Add-Path -Path C:\foo\bar
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $Path
    )
    
    Add-Content -Path $env:GITHUB_PATH `
                -Value $Path `
                -Encoding ascii
}