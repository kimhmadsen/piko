#!ruby
require "httpclient"
require "csv"
require "nokogiri"
require "piko/version"
require "piko/log_daten.rb"

module Piko

  class PikoClient
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
    
    def get_index
      clnt = HTTPClient.new
      domain = "http://#{host}/"
      clnt.set_auth(domain, user, password)
      clnt.get_content("http://#{host}/") # .status
    end
    
    def self.get_current_production index_html
      html_doc = Nokogiri::HTML(index_html)
      html_doc.xpath("//table/tr/td").each { |e|
        if e.text.include? "current" 
          #p e
          return e.next.next.text.strip.to_i
        end
        }
    end

    def self.get_daily_energy html
      html_doc = Nokogiri::HTML(html)
      html_doc.xpath("//table/tr/td").each { |e|
        if e.text.include? "daily energy" 
          #p e
          return e.next.next.text.strip.to_f 
        end
        }
    end

    def self.get_total_energy html
      html_doc = Nokogiri::HTML(html)
      html_doc.xpath("//table/tr/td").each { |e|
        if e.text.include? "total energy" 
          #p e
          return e.next.next.text.strip.to_i
        end
        }
    end
  end

  def self.current_numbers_to_json client
    html = client.get_index 
    current = PikoClient.get_current_production html
    daily = PikoClient.get_daily_energy html
    total = PikoClient.get_total_energy html

    return "{
  \"version\":\"1.0.0\",
  \"datastreams\":[
    {\"id\":\"production\", \"current_value\":\"#{current}\"},
    {\"id\":\"total_energy\", \"current_value\":\"#{total}\"},
    {\"id\":\"daily_energy\", \"current_value\":\"#{daily}\"}
  ]
}"
  end


end
