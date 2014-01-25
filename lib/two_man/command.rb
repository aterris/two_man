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
        puts "  Success!"
      else
        raise "#{repo[:name]} not installed. \n\nDid you mean?\n  two_man install #{repo[:name]}"
      end
      
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