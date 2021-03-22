$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Set-Output Tests' {
    
    Mock Write-Information { } -Verifiable -ParameterFilter { $MessageData -eq "`n::set-output name=foo::bar" }
    Set-Output -Name foo -Value bar

    It 'should output the correct message' {
        Assert-VerifiableMock
    }
}