module LanguageTool
  module Actions
    class Base
      attr_reader :api, :options

      def initialize(api, options = {})
        @api = api
        @options = options
      end

      def run
        raise NotImplementedError
      end

      def safe_run
        run
      rescue => e
        raise APIError, e
      end

      protected

      def uri(path = '')
        "#{api.base_uri}/#{path}"
      end

      def default_query
        {}
      end

      def underscore_to_camelcase(str)
        str.to_s.gsub(/_(.)/) { |match| "#{match[1].upcase}" }
      end

      def normalize_query(q)
        Hash[q.map { |k, v| [underscore_to_camelcase(k), v] }].select { |k, v| v }
      end
    end
  end
end
