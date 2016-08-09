module LanguageTool
  class APIError < RuntimeError
    attr_reader :exception

    def initialize(e)
      @exception = e
    end

    def type

    end
  end
end
