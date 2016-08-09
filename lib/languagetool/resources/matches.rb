module LanguageTool
  module Resources
    class Matches
      include ::Enumerable

      attr_reader :original, :matches, :software, :language

      def initialize(json)
        super()

        @original = json['original']
        @matches = json['matches'].map { |m| Match.new m }
        @software = Software.new json['software']
        @language = Language.new json['language']
      end

      def ok?
        matches.empty?
      end

      def auto_fix
        str = original.clone

        matches.reverse.each do |match|
          next if match.replacements.empty?

          str.slice! match.offset, match.length
          str.insert match.offset, match.replacements.first
        end

        str
      end

      def [](index)
        matches[index]
      end

      def each(&block)
        matches.each(&block)
      end

      def last
        matches.last
      end
    end
  end
end
