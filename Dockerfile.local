FROM mcr.microsoft.com/powershell:7.0.3-alpine-3.8
COPY ./module/ /usr/local/share/powershell/Modules/Endjin.GitHubActions
COPY ./profile.ps1 /opt/microsoft/powershell/7/Microsoft.PowerShell_profile.ps1
ENTRYPOINT [ "pwsh" ]