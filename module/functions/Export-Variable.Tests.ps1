$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe 'Export-Variable Tests' {
    
    # Ensure we don't permanently pollute the environment
    BeforeAll {
        $env:GITHUB_ENV_ORIG = $env:GITHUB_ENV
    }
    AfterAll {
        if ($env:GITHUB_ENV_ORIG) {
            $env:GITHUB_ENV = $env:GITHUB_ENV_ORIG
        }
        else {
            Remove-Item env:/GITHUB_ENV
        }
        Get-Item env:/GITHUB_ENV_ORIG -ErrorAction Ignore | Remove-Item
    }

    $env:GITHUB_ENV = "TestDrive:/github_env.txt"

    Export-Variable -Name foo -Value bar

    It 'should add the variable mapping to the correct file' {
        $key,$value = (Get-Content $env:GITHUB_ENV) -split "="
        
        $env:GITHUB_ENV | Should -Exist
        $key | Should -Be "foo"
        $value | Should -Be "bar"
    }
}