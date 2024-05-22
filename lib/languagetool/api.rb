module LanguageTool
  class API
    attr_reader :options

    DEFAULT_OPTIONS = {
      base_uri: 'https://languagetool.org/api/v2',
      premium_uri: 'https://api.languagetoolplus.com/v2',
      username: ENV['LANGUAGE_TOOL_USERNAME'],
      api_key: ENV['LANGUAGE_TOOL_API_KEY']
    }.freeze

    def initialize(options = {})
      @options = DEFAULT_OPTIONS.merge(options)
      @options[:base_uri] = @options[:premium_uri] if premium?
    end

    def premium?
      options[:username].present? && options[:api_key].present?
    end

    # Define options getters
    DEFAULT_OPTIONS.each do |k, v|
      define_method(k) { options[k] }
    end

    # Define actions helpers
    Actions.constants.select { |c| Class === Actions.const_get(c) }
                     .map { |c| Actions.const_get(c) }
                     .each do |klass|
                       define_method(klass.name.split('::').last.downcase) do |options = {}|
                         klass.new(self, options).safe_run
                       end
                     end
  end
end
