module TwoMan
  class Keys
    attr_accessor :key_1, :key_2

    def initialize
      @key_1 = PiPiper::Pin.new(:pin => 17, :direction => :out)
      @key_2 = PiPiper::Pin.new(:pin => 17, :direction => :out) 

    end

  end
end