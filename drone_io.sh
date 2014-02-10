# Go to project > Repository and set the branch filter
# Go to project build & test and set the comand "sh drone_io.sh

pub install

# ensure that the code is warning free
dartanalyzer test/test.dart
dartanalyzer lib/injectable_application.dart

# run tests
dart --enable-type-checks --enable-asserts test/test.dart

# gen docs
dartdoc lib/injectable_application.dart --package-root=packages

# copy docs up to github gh-pages branch
git checkout gh-pages
date > date.txt
rm -rf $(ls * | grep -v docs)
cd docs/* ..
git add -A
git commit -m"auto commit from drone.io"
git remote set-url origin git@github.com:christophehurpeau/dart-injectable_application.git
git push origin gh-pages
