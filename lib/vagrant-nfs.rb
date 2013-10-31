
require 'vagrant'
require 'vagrant-nfs/plugin'

module VagrantPlugins
  module NFS

    lib_path = Pathname.new(File.expand_path("../vagrant-nfs", __FILE__))
    autoload :Action, lib_path.join("action")

    def self.source_root
      @source_root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end

    I18n.load_path << File.expand_path('locales/en.yml', source_root)
    I18n.reload!
  end
end
