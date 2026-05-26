require 'open-uri'

ActionCable.server.config.cable = { "adapter" => "test" }

Dir[Rails.root.join("db/seeds/*.rb")].sort.each do |file|
  load file
end
