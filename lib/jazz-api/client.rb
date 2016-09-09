module Jazz
  class Client
    include HTTParty
    format :json
    debug_output $stdout

    base_uri 'https://api.resumatorapi.com/v1/'

    def initialize(api_key = nil)
      @api_key = api_key || Jazz.configuration.api_key

      @default_options = {
        query: { apikey: @api_key }
      }
    end

    def get_records(modules, options = {})
      args    = options[:args] || {}
      url     = build_url(modules, args)

      self.class.get("/#{url}", {
        query: @default_options[:query]
      })
    end

    def get_record(modules, id)
      url = "/#{modules}/#{id}"

      self.class.get(url, {
        query: @default_options[:query]
      })
    end

    def post(modules, options = {})
      options = @default_options.deep_merge(options)

      self.class.post("/#{modules}", options)
    end

    private

    def build_url(modules, args = {})
      endpoint = [modules]

      args.each do |key, value|
        endpoint << [key, value]
      end

      endpoint.join('/')
    end
  end
end
