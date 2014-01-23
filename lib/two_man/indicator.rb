module TwoMan
  class Indicator
    attr_accessor :pins

    def initialize(initial_state = :ready)
      @pins = {
        :armed => [PiPiper::Pin.new(:pin => 23, :direction => :out)],
        :launch => [PiPiper::Pin.new(:pin => 18, :direction => :out)],
        :error => [PiPiper::Pin.new(:pin => 25, :direction => :out)]
      }

      self.send(initial_state)
    end

    def ready
      @pins[:armed].map(&:off)
      @pins[:launching].map(&:off)
      @pins[:error].map(&:off)
    end

    def armed
      @pins[:armed].map(&:on)
      @pins[:launching].map(&:off)
      @pins[:error].map(&:off)
    end

    def launch
      @pins[:armed].map(&:off)
      @pins[:launching].map(&:on)
      @pins[:error].map(&:off)
    end

    def error
      @pins[:armed].map(&:off)
      @pins[:launching].map(&:off)
      @pins[:error].map(&:on)
    end

  end
end