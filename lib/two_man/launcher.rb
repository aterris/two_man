module TwoMan
  class Launcher
    STATUS = [:ready, :armed, :launch]

    attr_accessor :launch_code, :status, :indicator, :keys, :key_offset_time

    def initialize(launch_code = 'basic', key_offset_time)
      @launch_code = launch_code.classify
      @status = :ready
      @key_offset_time = key_offset_time

      @indicator = Indicator.new(@status)
      @keys = {:left => Key.new(20), :right => Key.new(21)}

      PiPiper.watch :pin => 17, :invert => true do |pin|
        if pin.value == 1 && @status == :armed
          launch
        end
      end

      loop do
        if @keys[:left].armed? && @keys[:right].armed? && simultaneous?
          arm
        end
        sleep 1
      end
    end

    def simultaneous?
      @keys[:left].time > @keys[:right].time - @key_offset_time || @keys[:left].time < @keys[:right].time + @key_offset_time
    end

    def set_status(status)
      return unless STATUS.include?(status)
      @status = status
    end

    def ready
      set_status(:ready)
      @indicator.ready
    end

    def ready?
      @status == :ready
    end

    def arm
      set_status(:armed)
      #@indicator.armed
      @keys.map(&:disarm)
      # armed timer countdown
    end

    def armed?
      @status == :armed
    end

    def launch
      set_status(:launch)
      @indicator.on
      # launch indicator timer? or let launch return or not and very quick (ie need min?)
      #LaunchCode::Basic.launch
      Kernel.const_get("LaunchCode::#{@launch_code}").launch
      @indicator.off
    end

    def launch?
      @status == :launch
    end

  end
end