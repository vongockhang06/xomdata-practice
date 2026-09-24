# Xom Data · Undo a commit and keep the index
# Problem: https://xomdata.com/practice/git-soft-reset
# Solved: 2026-09-24

git reset --soft
git reset --soft HEAD
git reset --soft HEAD~1
git status
git commit -m "Premature report"
git status
git log --oneline --graph --all
git reset HEAD~1
git status
git add report.md
