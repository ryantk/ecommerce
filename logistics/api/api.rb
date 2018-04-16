class Api < Sinatra::Base

  get '/' do
    content_type :json
    { health: :good }.to_json
  end

end