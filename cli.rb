require 'octokit'
require 'dotenv'
Dotenv.load

class AccountRepo
  def initialize
    @accounts = { "yutakakinjyo" =>  'yutaka'}
  end

  def find_by(name)
    @accounts[name]    
  end  
end

class Account

  def initialize
    @repo = AccountRepo.new
  end
  
  def name(assignee)
    return "no one" if assignee.nil?
    account_mapping(assignee.login)
  end

  private
  
  def account_mapping(login)
    account = @repo.find_by(login)
    account ? account : login
  end

end

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

class Service

  def self.run
    cl = Client.new
    repo = ARGV[0]
    cl.list_issues(repo)
  end

end

Service.run


