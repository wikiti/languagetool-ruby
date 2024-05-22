module LanguageTool
  module Actions
    class Check < Base
      REQUIRED_PARAMETERS = %i(text language).freeze
      OPTIONAL_PARAMETERS = %i(mother_tongue preferred_variants enabled_rules disabled_rules
                               enabled_categories disabled_categories enabled_only).freeze
      PARAMETERS = (REQUIRED_PARAMETERS + OPTIONAL_PARAMETERS).freeze

      def run
        response = api.premium? ? run_premium : run_free
        $languagetool_last_response = response
        Resources::Matches.new JSON.parse(response.body).merge('original' => options[:text])
      end

      protected

      def run_free
        RestClient.get uri('check'), params: query
      end

      def run_premium
        query_with_credentials = query.merge('username' => api.username, 'api_key' => api.api_key)
        RestClient.post uri('check'), params: query_with_credentials
      end

      def query
        normalize_query(PARAMETERS.map { |k| [k, options[k]] })
      end
    end
  end
end
