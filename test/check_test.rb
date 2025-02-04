require 'test_helper'

class CheckTest < Test::Unit::TestCase
  context 'the check action' do
    setup do
      @api = LanguageTool::API.new
    end

    should 'not fail for a correct string' do
      VCR.use_cassette 'check', record: :new_episodes do
        response = @api.check text: 'This is a correct string', language: 'en-US'

        assert_equal response.class, LanguageTool::Resources::Matches
        assert_equal response.count, 0
      end
    end

    should 'fail for an incorrect string' do
      VCR.use_cassette 'check' do
        response = @api.check text: 'This ish an correct stringg', language: 'en-US'

        assert_equal response.class, LanguageTool::Resources::Matches
        assert_equal response.count, 4

        response.each { |match| assert_equal match.class, LanguageTool::Resources::Match }
      end
    end

    should 'be able to fix an incorrect string' do
      VCR.use_cassette 'check' do
        response = @api.check text: 'This ish an correct stringg', language: 'en-US'
        assert_equal response.auto_fix, 'This is a correct string'
      end
    end

    should 'generate an exception with wrong parameters' do
      VCR.use_cassette 'check', record: :new_episodes do
        assert_raise(LanguageTool::APIError) { @api.check language: 'en-US' }
        assert_raise(LanguageTool::APIError) { @api.check text: 'Incomplete' }
      end
    end
  end
end
