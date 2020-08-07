function Log-Error
{
    <#
        .SYNOPSIS
            Creates a error message and prints the message to the log. 
            You can optionally provide a filename, line number, and column number where the error occurred.
        .EXAMPLE
            Log-error -Message "Missing semicolon" -FileName "foo.js" -Line 10 -Column 5
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, ParameterSetName="default")]
        [Parameter(Mandatory=$true, ParameterSetName="file")]
        [string]
        $Message,

        [Parameter(Mandatory=$true, ParameterSetName="file")]
        [string]
        $FileName,

        [Parameter(Mandatory=$true, ParameterSetName="file")]
        [int]
        $Line,

        [Parameter(Mandatory=$true, ParameterSetName="file")]
        [int]
        $Column
    )
    
    if ($PSCmdlet.ParameterSetName -eq "default") {
        Write-Output ("`n::error::{0}" -f $Message)
    } elseif ($PSCmdlet.ParameterSetName -eq "file") {
        Write-Output ("`n::error file={0},line={1},col={2}::{3}" -f $FileName, $Line, $Column, $Message)
    }
}