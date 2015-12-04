require 'minitest/autorun'
require './account_repo'

class AccountRepoTest < MiniTest::Test

  def setup
    @repo = AccountRepo.new
  end
  
  def test_regist
    @repo.regist(login: 'taro_github', slack_name: 'taro_slack')
    assert_equal 'taro_slack', @repo.find_by('taro_github')
  end

  def test_list
    list = {'yutakakinjyo' => 'yutaka', 'taro_github' => 'taro_slack'}
    @repo.regist(login: 'yutakakinjyo', slack_name: 'yutaka')
    @repo.regist(login: 'taro_github', slack_name: 'taro_slack')
    assert_equal list, @repo.list
  end
  
end
