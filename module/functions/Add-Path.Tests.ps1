$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Add-Path Tests' {

    # Ensure we don't permanently pollute the environment
    BeforeAll {
        $env:GITHUB_PATH_ORIG = $env:GITHUB_PATH
    }
    AfterAll {
        if ($env:GITHUB_PATH_ORIG) {
            $env:GITHUB_PATH = $env:GITHUB_PATH_ORIG
        }
        else {
            Remove-Item env:/GITHUB_PATH
        }
        Get-Item env:/GITHUB_PATH_ORIG -ErrorAction Ignore | Remove-Item
    }

    $env:GITHUB_PATH = "TestDrive:/github_path.txt"
    
    Add-Path -Path "C:\foo\bar"

    It 'should add the path to the correct file' {
        $env:GITHUB_PATH | Should -Exist
        "C:\foo\bar" | Should -BeIn (Get-Content $env:GITHUB_PATH)
    }
}