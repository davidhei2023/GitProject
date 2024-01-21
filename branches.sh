#!/bin/bash

#change username in "git remote set-url origin" command before you run it

echo 123 > file_c1
git add file_c1 
git commit -m "c1"
git checkout -b arik/bugfix1
echo 123 > file_c10
git add file_c10
git commit -m "c10"
echo 123 > file_c11
git add file_c11
git commit -m "c11"
git checkout main 
echo 123 > file_c2
git add file_c2
git commit -m "c2"
git checkout -b john/feature1
echo 123 > file_c3
git add file_c3
git commit -m "c3"
git checkout main 
git merge arik/bugfix1
git tag "v1.0.2"
git checkout john/feature1 
git checkout -b john/feature1-test
echo 123 > file_c5
git add file_c5
git commit -m "c5"
git checkout main 
echo 123 > file_c6
git add file_c6
git commit -m "c6"
git checkout john/feature1
echo 123 > file_c7
git add file_c7
git commit -m "c7"
git checkout main 
git merge john/feature1 
git tag "v1.0.3"
git checkout john/feature1-test 
echo 123 > file_c8
git add file_c8 
git commit -m "c8" 
git tag "john-only"
git checkout main 
echo 123 > file_c9
git add file_c9
git commit -m "c9"
cd test/
bash branches.sh 
cd ..
git remote set-url origin git@github.com:<change-to-your-Git-username>/GitProject.git  # copy link from github under ssh in 'code'
git push origin main --tag
git checkout john/feature1-test
git push origin john/feature1-test --tag
git checkout main 
git-sim log -n 50 --all
