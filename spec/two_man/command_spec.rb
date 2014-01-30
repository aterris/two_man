require 'spec_helper'

describe TwoMan::Command do

  before do
  end

  describe "install" do
    it 'can install a launch code repo'# do
  #     Git.should_receive(:clone).with(
  #       'git@github.com:aterris/launch_codes.git',
  #       'aterris/launch_codes',
  #       hash_including(:path => 'b')
  #     )
      
  #     TwoMan::Command.install('aterris/launch_codes')
  #  end

    it 'raises an exception if the launch code repo is already installed' do
      File.stub(:directory? => true)
      expect { TwoMan::Command.install('aterris/launch_codes') }.to raise_error(/aterris\/launch_codes already installed/)
    end
  end

  describe "update" do

    it 'can update a launch code repo'

    it 'raises an exception if the repo is not already installed' do
      File.stub(:directory? => false)
      expect { TwoMan::Command.update('aterris/launch_codes') }.to raise_error(/aterris\/launch_codes not installed/)
    end

  end

  describe "uninstall" do

    it 'can uninstall a launch code repo'

    it 'raises an exception if the repo is not already installed' do
      File.stub(:directory? => false)
      expect { TwoMan::Command.uninstall('aterris/launch_codes') }.to raise_error(/aterris\/launch_codes not installed/)
    end

  end

  describe 'launch code management' do

    it 'can validate a launch code'

    it 'can return all launch code files' do
      launch_codes = TwoMan::Command.launch_codes
      launch_codes.length.should == 1
      launch_codes.first.should include('lib/launch_code/console.rb')
    end

    it 'can prep a launch code for execution' do
      const = TwoMan::Command.prep_launch_code('console')
      const.should == ::LaunchCode::Console
    end
  end

  describe 'display' do

    it 'can display launch codes' do
      $stdout.should_receive(:puts).with('Available Launch Codes:')
      $stdout.should_receive(:puts).with("\e[32m  console\e[0m")
      TwoMan::Command.display_launch_codes
    end

    it 'can display launch code source repos'

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