
require "log4r"
require 'shellwords'

module VagrantPlugins
  module NFS
    module Action

      # This action installs the NFS client packages
      class InstallNFS

        def initialize(app, env)
          @app = app
          @logger = Log4r::Logger.new("vagrantplugins::nfs::action::installnfs")
          @machine = env[:machine]
          # Config#finalize! SHOULD be called automatically
          # @machine.config.omnibus.finalize!
        end

        def call(env)
          @app.call(env)

          return if !@machine.communicate.ready?

          env[:ui].info I18n.t('vagrant-nfs.action.installing', {})

          if ubuntu? then
            @machine.communicate.sudo("apt-get update")
            @machine.communicate.sudo("apt-get install nfs-common")
          end

          env[:ui].info I18n.t('vagrant-nfs.action.installed', {})
        end



        private

        def ubuntu?
          issue =~ /ubuntu/i
        end

        def centos
          issue =~ /centos/i
        end

        def issue
          return @issue if @issue
          issue = nil
          @machine.communicate.execute("cat /etc/issue") do |type, data|
            issue = data.strip if type == :stdout
          end
          @issue = issue
        end

      end
    end
  end
end
