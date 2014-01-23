module TwoMan
  class Launcher
    STATUS = [:ready, :armed, :launch]

    attr_accessor :launch_code, :status, :indicator, :keys, :key_offset_time

    def initialize(launch_code = 'basic', key_offset_time)
      @launch_code = launch_code
      @status = :ready
      @key_offset_time

      # there is an implict match of default status with the above line and this constructor
      @indicator = TwoMan::Indicator.new(@status)
      @keys = {:left => TwoMan::Key.new(20), :right => TwoMan::Key.new(21)}

      # PiPiper.watch :pin => 21, :invert => true do |pin|
      #   if pin.value == 1 && @status == :armed
      #     launch
      #   end
      # end

      # loop do
      #   if !armed? && !launching? &&  @keys[:left].armed? && @keys[:right].armed? && simultaneous?
      #     arm
      #   end
      #   sleep 1
      #
      #
      # end
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
      @indicator.armed

      @keys.map(&:off)
      # reset keys time (not really, but dont allow rearm until off)

      # armed timer countdown
    end

    def armed?
      @status == :armed
    end

    def launch
      set_status(:launch)
      @indicator.launch
      # launch indicator timer? or let launch return or not and very quick (ie need min?)
      LaunchCode::Basic.launch
      #Kernel.const_get("LaunchCode::#{@launch_code}").launch
    end

    def launch?
      @status == :launch
    end

  end
end