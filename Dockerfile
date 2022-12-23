FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.14
COPY ./module/ /usr/local/share/powershell/Modules/Endjin.GitHubActions
COPY ./profile.ps1 /opt/microsoft/powershell/7/Microsoft.PowerShell_profile.ps1
ENTRYPOINT [ "pwsh" ]