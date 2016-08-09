module LanguageTool
  module Resources
    class Language
      include Comparable

      attr_reader :name, :code, :long_code

      def initialize(json)
        @name = json['name']
        @code = json['code']
        @long_code = json['longCode'] || json['code']
      end

      def to_s
        "#{name} (#{long_code})"
      end

      def <=>(other)
        long_code <=> other.long_code
      end
    end
  end
end
