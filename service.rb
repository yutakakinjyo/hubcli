require './client.rb'

class Service
  def self.run
    cl = Client.new
    repo = ARGV[0]
    cl.list_issues(repo)
  end
end

Service.run


