function Log-Debug
{
    <#
        .SYNOPSIS
            Prints a debug message to the log. 
            You must create a secret named ACTIONS_STEP_DEBUG with the value true to see the debug messages set by this command in the log.
        .EXAMPLE
            Log-Debug -Message "Writing the foo variable..."
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $Message
    )
    
    Write-Output ("`n::debug::{0}" -f $Message)
}