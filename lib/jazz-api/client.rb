module Jazz
  class Client
    include HTTParty

    base_uri 'https://api.resumatorapi.com/v1'

    def initialize(api_key = nil)
      @api_key = api_key || Jazz.configuration.api_key
    end

    def get(modules, options = {})
      get_request("/#{modules}", options)
    end

    def post(modules, options = {})
      post_request("/#{modules}", options)
    end

    private

    def get_request(url, options)
      self.class.get(url, options)
    end

    def post_request(url, options)
      self.class.post(url, options)
    end
  end
end