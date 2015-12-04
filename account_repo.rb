class AccountRepo
  def initialize
    @accounts = { "yutakakinjyo" =>  'yutaka'}
  end

  def find_by(name)
    @accounts[name]    
  end

  def regist(login:, slack_name:)
    @accounts[login] = slack_name
  end
  
end
