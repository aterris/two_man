module TwoMan
  class Launcher
    STATUS = [:ready, :armed, :launch, :error]

    attr_accessor :launch_code, :status, :indicator, :keys

    def initialize(launch_code = 'basic')
      @launch_code = launch_code
      @status = :ready

      #@indicator = TwoMan::Indicator.new
      #@keys = [TwoMan::Key.new, TwoMan::Key.new]

      # PiPiper.watch :pin => 20, :invert => true do |pin|
      #   puts "Pin changed from #{pin.last_value} to #{pin.value}"
      #   case pin.value
      #   when 'left'
      #     if key2.position == :armed && key2.time < Time.now + 1.second
      #       arm
      #     elsif key2.position == :armed && key2.time >= Time.now + 1.second
      #       error
      #     elsif key2.position == :ready
      #       key1.position = :armed
      #       key1.time = Time.now
      #     else
      #     end
      #   when 'right'

      #   end
          
        
      # end

      # PiPiper.watch :pin => 21, :invert => true do |pin|
      #   puts "Pin changed from #{pin.last_value} to #{pin.value}"
      # end
      # code ot be called when turned..
      #  which way?
      #  armed vs launch

      launch

      loop do sleep 1 end
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

    def error
      set_status(:error)
      @indicator.error
      # error indicator timer
    end

    def error?
      @status == :error
    end

  end
end