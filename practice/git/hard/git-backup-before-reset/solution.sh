# Xom Data · Create a safety branch before reset
# Problem: https://xomdata.com/practice/git-backup-before-reset
# Solved: 2026-09-24

git branch backup/experiment
git branch
git reset --hard HEAD~1
