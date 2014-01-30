module TwoMan
  class Web < Sinatra::Base
    set :logging, false

    get '/' do
      "Two-Man Rule Launcher"
    end

  end
end