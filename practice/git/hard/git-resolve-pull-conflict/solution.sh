# Xom Data · Resolve a pull conflict
# Problem: https://xomdata.com/practice/git-resolve-pull-conflict
# Solved: 2026-09-24

git pull
edit config.txt region=global
git commit -am "Fix conflict"
git push
git log --oneline --graph --all
