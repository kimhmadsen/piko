#!ruby
require "httpclient"
require "csv"


class Piko
  attr_reader :host, :user, :password

  def initialize( host, user='pvserver', password='pvwr')
    @host = host
    @user = user
    @password = password
  end

  def get_logdaten_dat
    clnt = HTTPClient.new
    domain = "http://#{host}/"
    clnt.set_auth(domain, user, password)
    clnt.get_content("http://#{host}/LogDaten.dat") # .status
  end
  
  
end

class PikoDat
  def self.parse(str)
    p CSV.parse(str)
  end
  
  def self.read(file)
    p CSV.read(file)
  end
  
end

# puts "host:  #{ARGV[0]}"
# logdaten = Piko.new( ARGV[0] ).get_logdaten_dat

PikoDat.parse(logdaten)

