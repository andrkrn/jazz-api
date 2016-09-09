module Jazz
  class Client
    include HTTParty

    base_uri 'https://api.resumatorapi.com/v1'

    def initialize(api_key = nil)
      @api_key = api_key || Jazz.configuration.api_key

      @default_options = {
        query: { apikey: @api_key }
      }
    end

    def get(modules, options = {})
      get_request("/#{modules}", options)
    end

    def post(modules, options = {})
      post_request("/#{modules}", options)
    end

    private

    def get_request(url, options)
      options = @default_options.deep_merge(options)
      self.class.get(url, options)
    end

    def post_request(url, options)
      options = @default_options.deep_merge(options)
      self.class.post(url, options)
    end
  end
end
