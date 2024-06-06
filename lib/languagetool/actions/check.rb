module LanguageTool
  module Actions
    class Check < Base
      REQUIRED_PARAMETERS = %i(text language).freeze
      OPTIONAL_PARAMETERS = %i(mother_tongue preferred_variants enabled_rules disabled_rules
                               enabled_categories disabled_categories enabled_only).freeze
      PARAMETERS = (REQUIRED_PARAMETERS + OPTIONAL_PARAMETERS).freeze

      def run
        response = RestClient.get uri('check'), params: query
        $languagetool_last_response = response
        Resources::Matches.new JSON.parse(response.body).merge('original' => options[:text])
      end

      protected

      def query
        normalize_query(parameters_with_common_query_params)
      end

      def parameters_with_common_query_params
        PARAMETERS.map { |k| [k, options[k]] } + [
          [:username, api.username],
          [:api_key, api.api_key]
        ]
      end
    end
  end
end
