git config user.name "$GH_NAME"
git config user.email "$GH_EMAIL"

git checkout master
git pull origin master

find . -maxdepth 1 ! -name '_site' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} \;
mv docs/* .
rm -R docs/

git add -fA
git commit --allow-empty -m "$(git log gh-pages -1 --pretty=%B)"
git push origin master

echo "deployed successfully"
