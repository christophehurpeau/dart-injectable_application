# Go to project > Repository and set the branch filter
# Then click on "View Key" and paste it on github
# Go to project build & test and set the comand "sh drone_io.sh

pub install

echo "> Ensure that the code is warning free"
dartanalyzer test/test.dart
dartanalyzer lib/injectable_application.dart

echo "> Run tests"
dart --enable-type-checks --enable-asserts test/test.dart

echo "> Generate docs"
dartdoc lib/injectable_application.dart --package-root=packages

echo "> Copy docs up to github gh-pages branch"
mv docs docs-tmp
git checkout gh-pages
rm -Rf docs
mv docs-tmp docs
date > docs/date.txt
git add -A
git commit -m"auto commit from drone.io"
git remote set-url origin git@github.com:christophehurpeau/dart-injectable_application.git
git push origin gh-pages
