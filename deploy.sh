#!/bin/bash
set -e

if [ "$BRANCH_NAME" = "production" ]
then
    stagevar=prod
elif [ "$BRANCH_NAME" = "main" ]
then
    stagevar=staging
elif [ $BRANCH_NAME = "dev" ]
then
    stagevar=dev
fi

# if stage is equal to dev or staging, then build and push image as well
if [ "$stagevar" = "dev" ] || [ "$stagevar" = "staging" ]
then
    cd back/
    make build stage=$stagevar
    make push stage=$stagevar
    cd ..
    cd data/
    make build stage=$stagevar
    make push stage=$stagevar
    cd .. 
    cd data-script/
    make build stage=$stagevar
    make push stage=$stagevar
    cd ..
    cd front/
    make build stage=$stagevar
    make push stage=$stagevar
fi

# deploy image regardless of stage
# cd back/
# make deploy stage=$stagevar
# cd ..
# cd data/
# make deploy stage=$stagevar
# cd .. 
# cd data-script/
# make deploy stage=$stagevar
# cd ..
# cd front/
# make deploy stage=$stagevar
# cd .. 
