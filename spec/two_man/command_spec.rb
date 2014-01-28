require 'spec_helper'

describe TwoMan::Command do

  before do
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