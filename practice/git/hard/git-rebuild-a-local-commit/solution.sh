# Xom Data · Rebuild a local commit
# Problem: https://xomdata.com/practice/git-rebuild-a-local-commit
# Solved: 2026-09-24

git status
git reset --soft
git reset --soft HEAD~1
git commit -m "Add final model"
