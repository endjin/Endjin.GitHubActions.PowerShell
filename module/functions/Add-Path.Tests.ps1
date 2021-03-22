$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Add-Path Tests' {

    $env:GITHUB_PATH = "TestDrive:/github_path.txt"
    
    #Mock Write-Information { } -Verifiable -ParameterFilter { $InputObject -eq "`n::add-path::C:\foo\bar" }
    Add-Path -Path "C:\foo\bar"

    It 'should add the path to the correct file' {
        $env:GITHUB_PATH | Should -Exist
        "C:\foo\bar" | Should -BeIn (Get-Content $env:GITHUB_PATH)
    }
}