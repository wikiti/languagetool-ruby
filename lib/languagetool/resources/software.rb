module LanguageTool
  module Resources
    class Software
      attr_reader :name, :version, :build_date, :api_version, :status

      def initialize(json)
        @name = json['name']
        @version = json['version']
        @build_date = json['buildDate']
        @api_version = json['apiVersion']
        @status = json['status']
      end
    end
  end
end
