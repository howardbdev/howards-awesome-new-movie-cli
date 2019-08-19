class Movie

  attr_accessor :title, :summary, :url
  @@all = []

  def initialize(attrs)
    attrs.each {|k, v| self.send("#{k}=", v) if self.respond_to?("#{k}=")}
    self.save
  end

  def save
    self.class.all << self
  end

  def add_details(attrs)
    attrs.each {|k, v| self.send("#{k}=", v) if self.respond_to?("#{k}=")}
  end

  def self.all
    @@all
  end

end
