module LanguageTool
  module Resources
    class Languages < Array
      def initialize(json)
        super()
        json.each { |l| push Language.new(l) }
      end
    end
  end
end
