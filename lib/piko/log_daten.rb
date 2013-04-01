require "csv"


module Piko
  class LogDaten
    attr_accessor :csv
    def initialize csv=CSV.new 
      @csv = csv
    end

    def self.parse(str)
      i = str.index("Zeit\tDC1 U")
      self.new csv=CSV.parse(str[i..-1], :col_sep => "\t", :headers => true )
    end
  
    def self.read(file)
      self.new CSV.read(file, :col_sep => "\t", :headers => true )
    end

    
  end
  
  class LogRecord
    attr_accessor :time
    attr_accessor :dc1_u_V, :dc1_i_mA, :dc1_p_W, :dc1_t_degC, :dc1_s
    attr_accessor :dc2_u_V, :dc2_i_mA, :dc2_p_W, :dc2_t_degC, :dc2_s
    attr_accessor :dc3_u_V, :dc3_i_mA, :dc3_p_W, :dc3_t_degC, :dc3_s
    attr_accessor :ac1_u_V, :ac1_i_mA, :ac1_p_W, :ac1_t_degC
    attr_accessor :ac2_u_V, :ac2_i_mA, :ac2_p_W, :ac2_t_degC
    attr_accessor :ac3_u_V, :ac3_i_mA, :ac3_p_W, :ac3_t_degC
    attr_accessor :ac_F_hz, :ain1, :ain2, :ain3, :ain4

#   Zeit  DC1 U DC1 I DC1 P DC1 T DC1 S DC2 U DC2 I DC2 P DC2 T DC2 S DC3 U DC3 I DC3 P DC3 T DC3 S AC1 U AC1 I AC1 P AC1 T AC2 U AC2 I AC2 P AC2 T AC3 U AC3 I AC3 P AC3 T AC F  FC I  Ain1  Ain2  Ain3  Ain4  AC S  Err ENS S ENS Err KB S  total E Iso R Ereignis

  end
end



