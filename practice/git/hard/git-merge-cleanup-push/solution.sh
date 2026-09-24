# Xom Data · Merge, clean up, and push
# Problem: https://xomdata.com/practice/git-merge-cleanup-push
# Solved: 2026-09-24

git log --oneline --graph --all
git branch
git merge feature/report
git log --oneline --graph --all
git branch -d feature/report
git push
