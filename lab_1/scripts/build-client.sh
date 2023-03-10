#!/usr/bin/env bash

distFolderName=./dist
filePath=$(realpath $0)

archiveFilePath=$distFolderName/client-app.zip
appFolderPath=$distFolderName/app

qualityCheckFilePath="${filePath}/build-client/quality-check"
amountCheckFilePath="${filePath}/lab_1/scripts/build-client/module_4/task_1/2"

if ! test -f "package.json"
then
  echo The package.json does not exists
  exit 1
fi

# Run build

npm i
npm run prepare

source $qualityCheckFilePath

npm run build --configuration=$ENV_CONFIGURATION

if [ -e "$archiveFilePath" ]
then
  rm "$archiveFilePath"
  echo Archive was removed
fi

zip -r $archiveFilePath $appFolderPath

echo Archive was created

source $amountCheckFilePath $appFolderPath
