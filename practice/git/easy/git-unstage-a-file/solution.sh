# Xom Data · Unstage a file
# Problem: https://xomdata.com/practice/git-unstage-a-file
# Solved: 2026-09-24

git status
cat README.md
git restore --staged README,md
git restore --staged README.md
git status
git add .
git checkout --staged README.md
git checkout --unstaged README.md
git checkout --unstaged README.md
