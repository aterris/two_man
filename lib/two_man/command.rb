module TwoMan
  module Command

    def self.install(repo)
      repo = Command.normalize_repo_url(repo)

      if File.directory?(repo[:path])
        raise "#{repo[:name]} already installed. \n\nDid you mean?\n  two_man update #{repo[:name]}"
      else
        puts "Installing #{repo[:name]}"
        Git.clone(repo[:url], repo[:name], :path => File.expand_path('../../launch_code', __FILE__))
        puts "  Success!"
      end
    end

    def self.update(repo)
      repo = Command.normalize_repo_url(repo)

      if File.directory?(repo[:path])
        puts "Updating #{repo[:name]}"
        git_repo = Git.init(repo[:path])
        git_repo.pull
        puts "  Success!"
      else
        raise "#{repo[:name]} not installed. \n\nDid you mean?\n  two_man install #{repo[:name]}"
      end
    end

    def self.uninstall(repo)
      repo = Command.normalize_repo_url(repo)

      if File.directory?(repo[:path])
        puts "Uninstalling #{repo[:name]}"
        FileUtils.rm_rf(repo[:path])

        parent_path = File.expand_path('../', repo[:path])
        if Dir.entries(parent_path).length <= 2
          FileUtils.rm_rf(parent_path)
        end
        puts "  Success!"
      else
        raise "#{repo[:name]} not installed. \n\nDid you mean?\n  two_man install #{repo[:name]}"
      end
      
    end

    def self.launch_codes
      Dir[File.expand_path('../../launch_code/**/*.rb', __FILE__)]
    end

    def self.validate_launch_code(launch_code)
      if Command.launch_codes.none? {|lc| File.basename(lc, '.rb') == launch_code}
        raise "Invalid Launch Code [#{launch_code}]"
      end 

      launch_code = Command.prep_launch_code(launch_code)

      if !launch_code.respond_to?(:launch)
        raise "Invalid Launch Code [#{launch_code}]" 
      end

      launch_code
    end

    def self.prep_launch_code(launch_code)
      "LaunchCode::#{launch_code.classify}".constantize
      #Kernel.const_get("LaunchCode::#{launch_code.classify}")
    end

    def self.display_launch_codes
      puts "Available Launch Codes:"
      Command.launch_codes.each do |launch_code|
        launch_code = File.basename(launch_code, '.rb')
        puts "  #{launch_code}".color(:green) if Command.prep_launch_code(launch_code).respond_to?(:launch)
      end
    end

    def self.display_sources
      puts "Installed Launch Code Sources:"
      Dir[File.expand_path('../../launch_code/*/*', __FILE__)].each do |source_directory|
        source = source_directory.split('/').last(2).join('/')
        puts "  #{source}".color(:green)
      end
    end

    private
    def self.normalize_repo_url(repo)
      github_index = repo.index("github.com")

      name = repo.dup

      if github_index == nil
        name.slice!('.git')
        url = "git@github.com:#{name}.git"
      else
        name = name[(github_index + 11)..-5]
        url = repo
      end

      {
        :name => name,
        :url => url,
        :path => File.expand_path('../../launch_code/' + name, __FILE__)
      }
    end
    
  end
end