require 'spec_helper'

describe TwoMan::Command do

  before do
  end

  describe "install" do
    it 'can install a launch code repo' do
  #     Git.should_receive(:clone).with(
  #       'git@github.com:aterris/launch_codes.git',
  #       'aterris/launch_codes',
  #       hash_including(:path => 'b')
  #     )
      
  #     TwoMan::Command.install('aterris/launch_codes')
    end

    it 'raises an exception if the launch code repo is already installed' do
  #     # check if path is correct?
  #     File.stub(:directory? => true)
  #     Git.should_receive(:message) { raise "aterris/launch_codes already installed. \n\nDid you mean?\n  two_man update aterris/launch_codes"  }

  #     TwoMan::Command.install('aterris/launch_codes')
    end
  end

  describe "update" do

    it 'can update a launch code repo'

    it 'raises an exception if the repo is not already installed'

  end

  describe "uninstall" do

    it 'can uninstall a launch code repo'

    it 'raises an exception if the repo is not already installed'

  end

  describe 'launch code management' do

    it 'can validate a launch code'

    it 'can return all launch code files'

    it 'can prep a launch code for execution' do
      const = TwoMan::Command.prep_launch_code('console')
      const.should == ::LaunchCode::Console
    end
  end

  describe 'display' do

    it 'can display launch codes'

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