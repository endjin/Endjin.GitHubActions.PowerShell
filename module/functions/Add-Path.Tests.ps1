$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Add-Path Tests' {
    
    Mock Write-Output { } -Verifiable -ParameterFilter { $InputObject -eq "`n::add-path::C:\foo\bar" }
    Add-Path -Path "C:\foo\bar"

    It 'should output the correct message' {
        Assert-VerifiableMock
    }
}