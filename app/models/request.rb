class Request
  require 'open-uri'
  require 'json'
  BACKSTAGE = Figaro.env['uri']+ Figaro.env['path'] + Figaro.env['version'] + '/'
  TOKEN = Figaro.env['access_token']

  attr_reader :response

  def initialize(&block)
    if block_given?
      @response = JSON.parse open(BACKSTAGE + yield + TOKEN).read
    else
      raise 'No Block Given'
    end
  end

end