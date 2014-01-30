module TwoMan
  class Launcher
    STATUS = [:ready, :armed, :launch]
    KEY_OFFSET_TIME = 0.1

    attr_accessor :launch_code, :status, :indicator, :keys, :switch

    def initialize(launch_code)
      @launch_code = Command.validate_launch_code(launch_code)

      @status = :ready
      @indicator = Indicator.new()
      @keys = {:left => Key.new(20), :right => Key.new(21)}
      
      @switch = Switch.new(17) do |pin|
        if pin.value == 1 && armed? # or @switch.armed?
          launch
        end
      end

      loop do
        if @keys[:left].armed? && @keys[:right].armed? && simultaneous?
          arm
        end
        break if ENV['SPEC']
        sleep 1
      end
    end

    def simultaneous?
      return false if @keys[:left].time == nil || @keys[:right].time == nil
      (@keys[:left].time - @keys[:right].time).abs < KEY_OFFSET_TIME 
    end

    def ready
      set_status(:ready)
    end

    def arm
      set_status(:armed)
      @switch.arm
      @keys.map {|k,v| v.disarm }
    end

    def launch
      set_status(:launch)
      @indicator.on
      @launch_code.launch
      @indicator.off
      @switch.disarm
      @switch.position = 0
      set_status(:ready)
    end

    # status
    def set_status(status)
      return unless STATUS.include?(status)
      @status = status
    end

    def ready?
      @status == :ready
    end

    def armed?
      @status == :armed
    end

    def launch?
      @status == :launch
    end

  end
end