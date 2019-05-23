require "sinatra"
require "sinatra-websocket"
require_relative "lib/air.rb"
require_relative "config/database.rb"

class Server < Sinatra::Base
  set :sockets, Array.new

  get "/" do
    erb :airports, :layout => :default, :locals => { airports: Air::Airport.all }
  end

  get "/plane/:id" do |id|
    plane = Air::Plane.find(id)

    erb :plane, :layout => :default, :locals => { plane: plane }
  end

  get "/socket" do
    request.websocket do |ws|
      ws.onopen do
        settings.sockets << ws
      end

      ws.onmessage do |plane_id|
        plane = Air::Plane.find(plane_id)
        destination = Air::Airport.find_by(name: plane.destination)
        plane.airport_id = destination.id
        plane.save
        msg = [plane.id.to_s, destination.name].join("|")
        EM.next_tick { settings.sockets.each { |s| s.send(msg) } }
      end

      ws.onclose do
        settings.sockets.delete(ws)
      end
    end
  end
end
