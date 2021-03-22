$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Add-Mask Tests' {
    
    Mock Write-Information { } -Verifiable -ParameterFilter { $MessageData -eq "`n::add-mask::Super Secret" }
    Add-Mask -Value "Super Secret"

    It 'should output the correct message' {
        Assert-VerifiableMock
    }
}