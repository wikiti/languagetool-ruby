module LanguageTool
  class API
    FREE_BASE_URI = 'https://languagetool.org/api/v2'
    PREMIUM_BASE_URI = 'https://api.languagetoolplus.com/v2'

    # Define actions helpers
    Actions.constants.select { |c| Class === Actions.const_get(c) }
                     .map { |c| Actions.const_get(c) }
                     .each do |klass|
                       define_method(klass.name.split('::').last.downcase) do |options = {}|
                         klass.new(self, options).safe_run
                       end
                     end

    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def base_uri
      @base_uri ||= options.fetch(:base_uri, default_base_uri)
    end

    def username
      @username ||= options[:username]
    end

    def api_key
      @api_key ||= options[:api_key]
    end

    def premium?
      username.present? && api_key.present?
    end

    protected

    def default_base_uri
      premium? ? PREMIUM_BASE_URI : FREE_BASE_URI
    end
  end
end
