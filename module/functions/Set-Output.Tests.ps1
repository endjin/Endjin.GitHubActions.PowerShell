$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Set-Output Tests' {

    # Ensure we don't permanently pollute the environment
    BeforeAll {
        $env:GITHUB_OUTPUT_ORIG = $env:GITHUB_OUTPUT
    }
    AfterAll {
        if ($env:GITHUB_OUTPUT_ORIG) {
            $env:GITHUB_OUTPUT = $env:GITHUB_OUTPUT_ORIG
        }
        else {
            Remove-Item env:/GITHUB_OUTPUT
        }
        Get-Item env:/GITHUB_OUTPUT_ORIG -ErrorAction Ignore | Remove-Item
    }

    $env:GITHUB_OUTPUT = "TestDrive:/github_output.txt"

    Set-Output -Name foo -Value bar
    $key,$value = (Get-Content $env:GITHUB_OUTPUT) -split "="

    It 'should output the correct message' {
        $env:GITHUB_OUTPUT | Should -Exist
        $key | Should -Be "foo"
        $value | Should -Be "bar"
    }
}