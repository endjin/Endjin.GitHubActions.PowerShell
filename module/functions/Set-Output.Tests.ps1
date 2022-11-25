$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Set-Output Tests' {

    $env:GITHUB_OUTPUT = "TestDrive:/github_output.txt"

    Set-Output -Name foo -Value bar
    $key,$value = (Get-Content $env:GITHUB_OUTPUT) -split "="

    It 'should output the correct message' {
        $env:GITHUB_OUTPUT | Should -Exist
        $key | Should -Be "foo"
        $value | Should -Be "bar"
    }
}