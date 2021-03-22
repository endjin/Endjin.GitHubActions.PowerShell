$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Log-Warning Tests' {
    
    Mock Write-Information { } -Verifiable -ParameterFilter { $MessageData -eq "`n::warning::Missing semicolon" }
    Log-Warning -Message "Missing semicolon"

    It 'should output the correct message' {
        Assert-VerifiableMock
    }
}

Describe 'Log-Warning with file Tests' {
    
    Mock Write-Information { } -Verifiable -ParameterFilter { $MessageData -eq "`n::warning file=foo.js,line=10,col=5::Missing semicolon" }
    Log-Warning -Message "Missing semicolon" -FileName "foo.js" -Line 10 -Column 5

    It 'should output the correct message' {
        Assert-VerifiableMock
    }
}