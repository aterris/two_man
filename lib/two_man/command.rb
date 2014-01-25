module TwoMan
  module Command

    def self.install(url)
      puts "Installing #{url}"
    end

    def self.validate_launch_code(launch_code)
      if Command.launch_codes.none? {|lc| File.basename(lc, '.rb') == launch_code}
        raise "Invalid Launch Code [#{launch_code}]"
      end 
    end

    def self.launch_codes
      Dir[File.expand_path('../../launch_code/**/*.rb', __FILE__)]
    end

    def self.display_launch_codes
      puts "Installed Launch Codes:"
      Command.launch_codes.each do |launch_code|
        puts "  #{File.basename(launch_code, '.rb')}".color(:green)
      end
    end
    
  end
end