require 'octokit'
require 'dotenv'
Dotenv.load

client = Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
Octokit.auto_paginate = true

repo = ARGV[0]

client.list_issues(repo, {assignee: client.user.login}).each do |issue|
  puts issue.title
end
