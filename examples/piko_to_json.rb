#!/usr/bin/ruby
require "piko"

class PikoToJson
  def self.save_to_json( target, file)
    client = Piko::PikoClient.new( target )
    json = Piko.current_numbers_to_json( client)
    File.open(file, "w") do |f|
      f.write( json )
    end
  end
end

PikoToJson.save_to_json "192.168.1.7", "cosm.json"

