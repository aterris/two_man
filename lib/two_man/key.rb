module TwoMan
  class Key
    POSITIONS = [:off, :armed]
    attr_accessor :position, :time

    def initialize(pin_number)
      PiPiper.watch :pin => pin_number, :invert => true do |pin|
        (pin.value == 1) ? arm : disarm
      end
    end

    def armed?
      @position == :armed
    end

    def arm
      @position = :armed
      @time = Time.now
    end

    def disarm
      @position = :off
      @time = nil
    end

  end
end