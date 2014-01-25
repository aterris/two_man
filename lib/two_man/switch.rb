module TwoMan
  class Switch
    POSITIONS = [:off, :armed, :launch]
    attr_accessor :position

    def initialize(pin_number, &block)
      PiPiper.watch :pin => pin_number, :invert => true do |pin|
        yield
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