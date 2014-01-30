module TwoMan
  class Indicator
    attr_accessor :pins

    def initialize(initial_state = :off)
      @pins = [
        PiPiper::Pin.new(:pin => 18, :direction => :out),
        PiPiper::Pin.new(:pin => 23, :direction => :out),
        PiPiper::Pin.new(:pin => 25, :direction => :out)
      ]

      self.send(initial_state)
    end

    def off
      @pins.map(&:off)
    end

    def on
      @pins.map(&:on)
    end

  end
end