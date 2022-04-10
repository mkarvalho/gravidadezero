Remove-Item -Recurse -Force .\logs\browser
Copy-Item -Path (Get-ChildItem -Path .\logs\pabot_results -Filter *.png -Recurse | %{$_.FullName}) -Destination (New-Item -ItemType Directory -Path .\logs\browser\screenshot\ ) -Force