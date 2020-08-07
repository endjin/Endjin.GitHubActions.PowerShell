$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Export-Variable Tests' {
    
    Mock Write-Output { } -Verifiable -ParameterFilter { $InputObject -eq "`n::set-env name=foo::bar" }
    Export-Variable -Name foo -Value bar

    It 'should output the correct message' {
        Assert-VerifiableMock
    }
}