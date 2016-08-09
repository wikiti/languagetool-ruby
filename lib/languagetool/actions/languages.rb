module LanguageTool
  module Actions
    class Languages < Base
      def run
        response = RestClient.get uri('languages')
        $languagetool_last_response = response
        Resources::Languages.new JSON.parse(response.body)
      end
    end
  end
end
