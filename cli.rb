require 'octokit'
require 'dotenv'
Dotenv.load

def account_reposiroty(name)
  accounts = { "yutakakinjyo" =>  'yutaka'}
  accounts[name]
end

def account_mapping(login)
  account = account_reposiroty(login)
  account ? account : login
end

def name(assignee)
  return "no one" if assignee.nil?
  account_mapping(assignee.login)
end

client = Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
Octokit.auto_paginate = true

puts client.rate_limit.remaining

repo = ARGV[0]

client.list_issues(repo).each do |issue|
  puts issue.title + " " + name(issue.assignee)
end

