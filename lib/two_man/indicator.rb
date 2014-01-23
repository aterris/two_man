module TwoMan
  class Indicator
    attr_accessor :pins

    def initialize
      pins = {
        :armed => [PiPiper::Pin.new(:pin => 17, :direction => :out)],
        :launch => [PiPiper::Pin.new(:pin => 18, :direction => :out)],
        :error => [PiPiper::Pin.new(:pin => 19, :direction => :out)]
      }

      self.ready
    end

    def ready
      pins[:armed].map(&:off)
      pins[:launching].map(&:off)
      pins[:error].map(&:off)
    end

    def armed
      pins[:armed].map(&:on)
      pins[:launching].map(&:off)
      pins[:error].map(&:off)
    end

    def launch
      pins[:armed].map(&:off)
      pins[:launching].map(&:on)
      pins[:error].map(&:off)
    end

    def error
      pins[:armed].map(&:off)
      pins[:launching].map(&:off)
      pins[:error].map(&:on)
    end

  end
end