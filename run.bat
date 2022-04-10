robot -l NONE -o NONE -r NONE .\tasks\
pabot -d logs -v BROWSER:chromium -v HEADLESS:True tests

powershell -file ".\copyscreenshot.ps1"