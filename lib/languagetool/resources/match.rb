module LanguageTool
  module Resources
    class Match
      attr_reader :message, :short_message, :replacements, :offset, :length, :context, :rule

      def initialize(json)
        @message = json['message']
        @short_message = json['shortMessage']
        @replacements = json['replacements'].map { |hash| hash['value'] }.freeze
        @offset = json['offset']
        @length = json['length']

        @context = Context.new json['context']
        @rule = Rule.new json['rule']
      end
    end
  end
end
