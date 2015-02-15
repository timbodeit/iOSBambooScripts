#!/usr/bin/env ruby

buildNumber = ENV['bamboo_buildNumber']
branch      = ENV['bamboo_repository_branch_name']
commitHash  = ENV['bamboo_repository_revision_number']
plistPath   = ENV['bamboo_info_plist_path']

def numberprefix(branchname)
  branchtype = branchname.sub(/(?:(b)(?:ugfix)|(f)(?:eature)|(h)(?:otfix)|(r)(?:elease)|(d)(?:evelo(?:pment){0,1})|.)(?:\/[A-Z]{1,4}-([0-9]*)-)?.*/,'\1\2\3\4\5\6_')
  branchtype = branchtype.sub(/^([_0-9]*)/,'u')
  return branchtype
end

if (branch != "master") 
  buildNumber = numberprefix(branch) + commitHash[0...7];
end

`/usr/libexec/PlistBuddy -c "Set :CFBundleVersion #{buildNumber}" #{plistPath}`

