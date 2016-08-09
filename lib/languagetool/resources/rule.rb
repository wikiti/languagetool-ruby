module LanguageTool
  module Resources
    class Rule
      attr_reader :id, :description, :issue_type, :category

      def initialize(json)
        @id = json['id']
        @description = json['description']
        @issue_type = json['issueType']
        @offset = json['offset']
        @length = json['length']

        @category = RuleCategory.new json['category']
      end
    end
  end
end
