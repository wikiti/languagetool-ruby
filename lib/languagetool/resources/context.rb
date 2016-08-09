module LanguageTool
  module Resources
    class Context
      attr_reader :text, :offset, :length

      def initialize(json)
        @text = json['text']
        @offset = json['offset']
        @length = json['length']
      end
    end
  end
end
