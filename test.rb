require 'minitest/autorun'
require './account_repo'

class AccountRepoTest < MiniTest::Test

  def setup
    @repo = AccountRepo.new
  end
  
  def test_account
    @repo.regist(login: 'ryukyu', slack_name: 'taro')
    assert_equal 'taro', @repo.find_by('ryukyu')
  end
end
