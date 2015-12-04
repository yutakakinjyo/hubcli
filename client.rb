require 'octokit'
require 'dotenv'
require './account'
Dotenv.load


class Client

  def initialize
    @client = Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])
    @account = Account.new
    Octokit.auto_paginate = true
    puts @client.rate_limit.remaining
  end

  def list_issues(repo)
    @client.list_issues(repo).each do |issue|
      puts issue.title + " " + @account.name(issue.assignee) if issue.assignee
    end
  end
  
end
