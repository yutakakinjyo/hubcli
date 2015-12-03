require 'octokit'
require 'dotenv'
Dotenv.load

def account_reposiroty(name)
  accounts = { "yutakakinjyo" =>  'yutaka'}
  accounts[name]
end

def decorate(account)
  account ? account : "no one"
end

def account_mapping(login)
  account = account_reposiroty(login)
  decorate(account)
end

def name(assignee)
  login = assignee ? assignee.login : nil
  account_mapping(login)
end

client = Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
Octokit.auto_paginate = true

puts client.rate_limit.remaining

repo = ARGV[0]

client.list_issues(repo).each do |issue|
  puts issue.title + " " + name(issue.assignee)
end

