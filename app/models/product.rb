class Product

  attr_reader :data
  attr_accessor :id, :name

  def initialize(args ={})
    args.each {|key,value| instance_variable_set("@#{key}", value) unless value.nil? }
  end

  def self.all
    @data = Request.new{'products'}.response
    @data.map {|d| self.new(:name => d['name'], :id => d['id']) }
  end


end