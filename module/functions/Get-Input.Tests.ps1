$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Get-Input Tests' {
    
    $env:INPUT_foo = "bar"
    $res = Get-Input -Name foo

    It 'should return the correct value' {
        $res | Should -Be "bar"
    }
}