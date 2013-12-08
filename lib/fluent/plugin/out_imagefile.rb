require 'Base64'

module Fluent
  class Fluent::ImageFileOutput < Fluent::Output
    Fluent::Plugin.register_output('imagefile', self)

    def initialize
      super
    end

    config_param :save_dir, :string
    config_param :filename_key, :string
    config_param :extension, :string
    config_param :image_key, :string
    config_param :base64encoded, :bool

    def configure(conf)
      super

    end

    def start
      super

    end

    def shutdown
      super

    end

    def emit(tag, es, chain)
      es.each {|time,record|
        file_fullpath = File.join(@save_dir, "#{record[@filename_key]}.#{@extension}")
        
        media = record[@image_key]
        media = Base64.decode64(media) if @base64encoded
        
        File.open(file_fullpath, 'wb') {|file| file.write(media)}
      }

      chain.next
    end
  end
end
