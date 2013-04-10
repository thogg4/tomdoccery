require 'sinatra/base'
module Tomdoccery
  class Web < Sinatra::Base
    dir = File.expand_path(File.dirname(__FILE__) + "/../../web")
    set :public_folder, "#{dir}/assets"
    set :views,  "#{dir}/views"
    set :root, "#{dir}/public"

    before do
      @prefix = env['SCRIPT_NAME']
    end

    def sanitize(s)
      s.gsub!('#', '') rescue nil
    end

    get '/' do
      redirect "#{ @prefix }/#{ Tomdoccery::Base.new.menu_items[0][:link] }"
      slim :index
    end

    get '/:model' do |model|
      tommy = Tomdoccery::Base.new
      @menu_items = tommy.menu_items
      @blocks = tommy.blocks(model)
      slim :model
    end
  end
end
