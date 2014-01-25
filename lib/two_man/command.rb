module TwoMan
  module Command

    def self.install(url)
      puts "Installing #{url}"
    end

    def self.launch_codes
      Dir['lib/launch_code/**/*.rb']
    end

    def self.display_launch_codes
      puts "Installed Launch Codes:"
      Command.launch_codes.each do |launch_code|
        puts "  #{File.basename(launch_code, '.rb')}".color(:green)
      end
    end
    

  end
end