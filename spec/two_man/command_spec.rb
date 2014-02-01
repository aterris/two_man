require 'spec_helper'

describe TwoMan::Command do

  before do
  end

  describe "install" do
    before do
      $stdout.stub(:puts)
    end

    it 'can install a launch code repo' do
      Git.should_receive(:clone).with(
        'git@github.com:aterris/launch_codes.git',
        'aterris/launch_codes',
        {:path => File.expand_path('../../../lib/launch_code', __FILE__)}
      )
      TwoMan::Command.should_receive(:setup)

      TwoMan::Command.install('aterris/launch_codes')
   end

    it 'raises an exception if the launch code repo is already installed' do
      File.stub(:directory? => true)
      expect { TwoMan::Command.install('aterris/launch_codes') }.to raise_error(/aterris\/launch_codes already installed/)
    end
  end

  describe "update" do
    before do
      $stdout.stub(:puts)
    end
    
    it 'can update a launch code repo' do
      File.stub(:directory? => true)
      path = File.expand_path('../../../lib/launch_code', __FILE__)

      repo = double
      repo.stub(:pull)
      repo.should_receive(:pull)
      Git.should_receive(:init).with(path + '/aterris/launch_codes') { repo }
      TwoMan::Command.should_receive(:setup)

      TwoMan::Command.update('aterris/launch_codes')
    end

    it 'raises an exception if the repo is not already installed' do
      File.stub(:directory? => false)
      expect { TwoMan::Command.update('aterris/launch_codes') }.to raise_error(/aterris\/launch_codes not installed/)
    end

  end

  describe "uninstall" do
    before do
      $stdout.stub(:puts)
    end

    it 'can uninstall a launch code repo' do
      FileUtils.mkdir_p(File.expand_path('../../../lib/launch_code/aterris/launch_codes', __FILE__))
      
      TwoMan::Command.uninstall('aterris/launch_codes')
      
      File.directory?(File.expand_path('../../../lib/launch_code/aterris', __FILE__)).should == false
    end

    it 'can uninstall a launch code repo that shares a user directory' do
      FileUtils.mkdir_p(File.expand_path('../../../lib/launch_code/aterris/launch_codes', __FILE__))
      FileUtils.mkdir_p(File.expand_path('../../../lib/launch_code/aterris/more', __FILE__))

      TwoMan::Command.uninstall('aterris/more')

      File.directory?(File.expand_path('../../../lib/launch_code/aterris/more', __FILE__)).should == false
      File.directory?(File.expand_path('../../../lib/launch_code/aterris/launch_codes', __FILE__)).should == true

      TwoMan::Command.uninstall('aterris/launch_codes')
      File.directory?(File.expand_path('../../../lib/launch_code/aterris/launch_codes', __FILE__)).should == false
    end

    it 'raises an exception if the repo is not already installed' do
      File.stub(:directory? => false)
      expect { TwoMan::Command.uninstall('aterris/launch_codes') }.to raise_error(/aterris\/launch_codes not installed/)
    end

  end

  it 'can setup' do
    Dir.should_receive(:chdir).with(File.expand_path('../../../', __FILE__))
    #Kernel.should_receive(:system)

    TwoMan::Command.setup
  end

  describe 'launch code management' do

    it 'can validate a proper launch code' do
      launch_code = TwoMan::Command.validate_launch_code('console')
      launch_code.should == LaunchCode::Console
    end

    it 'can reject an invalid launch code because it does not exist' do
      expect { TwoMan::Command.validate_launch_code('fake') }.to raise_error(/Launch Code Not Found \[fake\]/)
    end

    it 'can reject an invalid launch code because it does not have a launch method' do
      path = File.expand_path('../../../lib/launch_code', __FILE__)
      FileUtils.mkdir_p(File.expand_path('../../../lib/launch_code/aterris/launch_codes', __FILE__))
      File.open(path + '/aterris/launch_codes/fake.rb', 'w') { |file| file.write("module LaunchCode module Fake end end") }
      require path + '/aterris/launch_codes/fake.rb'

      expect { TwoMan::Command.validate_launch_code('fake') }.to raise_error(/Invalid Launch Code \[fake\]/)

      FileUtils.rm_rf(File.expand_path('../../../lib/launch_code/aterris', __FILE__))
    end

    it 'can return all launch code files' do
      launch_codes = TwoMan::Command.launch_codes
      launch_codes.length.should == 1
      launch_codes.first.should include('lib/launch_code/console.rb')
    end

    it 'can prep a launch code for execution' do
      const = TwoMan::Command.prep_launch_code('console')
      const.should == LaunchCode::Console
    end
  end

  describe 'display' do

    it 'can display launch codes' do
      $stdout.should_receive(:puts).with('Available Launch Codes:')
      $stdout.should_receive(:puts).with("\e[32m  console\e[0m")
      TwoMan::Command.display_launch_codes
    end

    it 'can display launch code source repos' do
      FileUtils.mkdir_p(File.expand_path('../../../lib/launch_code/aterris/launch_codes', __FILE__))

      $stdout.should_receive(:puts).with('Installed Launch Code Sources:')
      $stdout.should_receive(:puts).with("\e[32m  aterris/launch_codes\e[0m")
      TwoMan::Command.display_sources

      FileUtils.rm_rf(File.expand_path('../../../lib/launch_code/aterris', __FILE__))
    end

  end
  
  it "can normalize repo urls" do
    repo_urls = [
      'aterris/launch_codes',
      'git@github.com:aterris/launch_codes.git',
      'https://github.com/aterris/launch_codes.git'
    ]

    repo_urls.each do |repo_url|
      repo = TwoMan::Command.send(:normalize_repo_url, repo_url)

      repo[:name].should == 'aterris/launch_codes'
      repo[:path].should include('lib/launch_code/aterris/launch_codes')
      
      url = (repo_url.include? '://github.com/') ? 'https://github.com/aterris/launch_codes.git' : 'git@github.com:aterris/launch_codes.git'
      repo[:url].should == url
    end

  end

end