$git = "C:\Program Files\Git\cmd\git.exe"
$repo = "C:\Users\USER\Desktop\LLM Wiki_1122"

Set-Location $repo

# Configure identity (safe defaults if not set)
& $git config --global user.email "littlebear4327@users.noreply.github.com"
& $git config --global user.name "littlebear4327-netizen"

# Init
& $git init

# Stage all
& $git add .

# Commit
& $git commit -m "init: Jung Psychological Types LLM Wiki (CW6, 651pp) + MBTI Graph Slides"

Write-Host "--- COMMIT DONE ---"
