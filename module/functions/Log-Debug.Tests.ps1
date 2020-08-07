$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Log-Debug Tests' {
    
    Mock Write-Output { } -Verifiable -ParameterFilter { $InputObject -eq "`n::debug::Setting the foo variable..." }
    Log-Debug -Message "Setting the foo variable..."

    It 'should output the correct message' {
        Assert-VerifiableMock
    }
}