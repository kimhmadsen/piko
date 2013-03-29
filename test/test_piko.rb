require "minitest/autorun"
require "pp"
require "piko"


class TestPiko < MiniTest::Unit::TestCase
  include Piko
  def setup
  end

  def teardown
  end

  def test_get_dat_file
    skip
    logdaten = Piko::PikoClient.new( "192.168.1.7" ).get_logdaten_dat
    refute_nil logdaten

    File.open("test/data/LogDaten.dat", "w") do |f|
      f.print logdaten
    end
  end

  def test_index_file
    skip
    data = PikoClient.new( "192.168.1.7" ).get_index
    refute_nil data

    File.open("test/data/index.html", "w") do |f|
      f.print data
    end
  end

  def test_current_production
    index_html = File.read("test/data/index.html")
    refute_nil index_html
    current_production = PikoClient.get_current_production( index_html )
    pp current_production
    refute_nil current_production
    # assert_match(/[1-9][0-9]*]/, current_production) 
  end

  def test_daily_energy
    index_html = File.read("test/data/index.html")
    refute_nil index_html
    current_production = PikoClient.get_daily_energy( index_html )
    pp current_production
    refute_nil current_production
    # assert_match(/[1-9][0-9]*]/, current_production) 
  end

  def test_total_energy
    index_html = File.read("test/data/index.html")
    refute_nil index_html
    current_production = PikoClient.get_total_energy( index_html )
    pp current_production
    refute_nil current_production
    # assert_match(/[1-9][0-9]*]/, current_production) 
  end

  def test_current_numbers_to_json
    client = PikoClient.new( "192.168.1.7" )
    json = Piko.current_numbers_to_json( client)
    refute_nil json
  end

  def test_parse_dat_file
    pd = LogDaten.read("test/data/LogDaten.dat")
   # pp pd
    refute_nil pd
  end
end

