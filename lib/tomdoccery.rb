require "tomdoccery/version"

module Tomdoccery
  class Base
    attr_reader :menu_items
    attr_reader :directory
    attr_reader :models

    def initialize
      @directory = './app/models/'
      @models = Dir.glob('./app/models/*')
      @menu_items = set_menu_items
    end

    def set_menu_items
      @models.map do |path|
        a = path.split('/')
        name = a[a.length-1]
        camel = name.gsub!('.rb', '').gsub!(/^[a-z]|_+[a-z]/) { |a| a.upcase }.gsub('_', '')
        { display: camel, link: name.downcase }
      end
    end

    def blocks(model)
      blocks = parse_model(File.read(@directory + model + '.rb'))
      blocks.map do |b|
        parse_block(b)
      end
    end

    def parse_model(file)
      file.scan(/^[ ]+(#[ ][Internal:|Public:|Deprecated:].*?def[ ].*?$)/m).flatten || []
    end

    def parse_block(block)
      block.match(/(^[ ]?#[ ](Internal:|Public:|Deprecated:)[ ].*?#\n)(^[ ]*#[ ]Examples.*?#\n)(^[ ]*#[ ]Returns.*?\.)(.*)/m) || []
    end

  end
end
