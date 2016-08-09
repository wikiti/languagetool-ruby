require 'helper'

class TestLanguages < Test::Unit::TestCase
  context 'the languages action' do
    setup do
      @api = LanguageTool::API.new
    end

    should 'retrieve a full list of available languages' do
      VCR.use_cassette 'languages' do
        languages = @api.languages
        assert_equal languages.class, LanguageTool::Resources::Languages
        assert(languages.size > 0)
      end
    end

    should 'ignore query parameters' do
      VCR.use_cassette 'languages' do
        assert_equal @api.languages, @api.languages(fake: 'fake')
      end
    end
  end
end
