module TwoMan
  class Key
    POSITIONS = [:off, :armed]
    attr_accessor :position, :time

    def initialize(pin_number)
      PiPiper.watch :pin => pin_number, :invert => true do |pin|
        if pin.value == 1
          @position == :armed
          @time = Time.now
        else
          @position == :off
          @time = nil
        end
      end
    end

    def armed?
      @position == :armed
    end

    def arm
      @position = :armed
    end

    def disarm
      @position = :off
    end

  end
end