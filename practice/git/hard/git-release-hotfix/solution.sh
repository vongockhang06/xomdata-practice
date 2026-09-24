# Xom Data · Simulate a release hotfix
# Problem: https://xomdata.com/practice/git-release-hotfix
# Solved: 2026-09-24

git log
git branch
git checkout -b hotfix/nulls
ls
git branch
branch main
git checkout main
ls
cat README.md
git checkout hotfix/nulls
edit clean.py handle-nulls
git add .
git commit -m "Fix"
git branch
git checkout main
edit CHANGELOG.md hotfix
git add .
git commit -m "Update changelog"
git log
git clean
git checkout hotfix/nulls
git lgo
git log
git checkout main
git merge hotfix/nulls
git branch -d hotfix/nulls
git push
