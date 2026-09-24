# Xom Data · Resolve a merge conflict
# Problem: https://xomdata.com/practice/git-resolve-merge-conflict
# Solved: 2026-09-24

git branch
git merge
git merge feature/config
edit config.txt region=all
git log
git log --oneline --graph --all
git status
git add config.txt
git status
git commit config.txt
git commit -m config.txt "Fix conflict"
