#Build Scripts for building iOS Projects with Bamboo

##Building

The build.sh script will build your project and generate a .ipa file.

The build number is automatically set using the following scheme:
- on master branch: same as bamboo plan build number
- on develop: d\_<7digitCommitHash>
- on feature branches: f<JIRA-Ticket-Number>\_<7digitCommitHash>
- on relese/hotfix/bugfix branches: Similar to feature branch

Make sure you always relase to the App Store from master, as this is the only
branch, where the build numbers match Apples guidelines. All others have the
priority set on providing useful information during development and testing.

###How to use:

Create a new Plan in Bamboo linked to the repository that contains your iOS project.
Bamboo will automatically create a default stage for you, that already contains
a task to check out the repository.

Add a new Script task:

    <full path to this repo>/build.sh

Then in the jobs artifacts section add these definitions:

|Name|Location|Copy pattern|Shared|
|----|--------|------------|------|
|Archive|artifacts|\*.xcarchive.zip|Y|
|dSYMs|artifacts|\*.dSYM.zip|Y|
|IPA|artifacts|\*.ipa|Y|

Archive 

####Configuration:

You will need to set the following variables in your plan configuration:

- `scheme_name` The name of the scheme that you want to build
- `info_plist_path` The path to the Info.plist file for your scheme. Used for
  automatically setting the build number

Optional:

- `worspace path` (coming soon)
- `keychain_name` (coming soon)
- `keychain_password` (coming soon)
