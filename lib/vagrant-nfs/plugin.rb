
# This is a sanity check to make sure no one is attempting to install
# this into an early Vagrant version.
if Vagrant::VERSION < "1.1.0"
  raise "The Vagrant NFS plugin is only compatible with Vagrant 1.1+"
end

module VagrantPlugins
  module NFS
    class Plugin < Vagrant.plugin("2")

      name "NFS"
      description <<-DESC
      This plugin ensures that the NFS client packages are installed.
      DESC

      action_hook(:install_nfs, Plugin::ALL_ACTIONS) do |hook|
        require_relative "action/install_nfs"
        hook.before(Vagrant::Action::Builtin::NFS, Action::InstallNFS)
      end

    end
  end
end
