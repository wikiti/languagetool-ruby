module LanguageTool
  module Resources
    class RuleCategory
      attr_reader :id, :name

      def initialize(json)
        @id = json['id']
        @name = json['name']
      end
    end
  end
end
