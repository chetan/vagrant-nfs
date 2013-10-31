
module VagrantPlugins
  module NFS
    module Action
      action_root = Pathname.new(File.expand_path("../action", __FILE__))
      autoload :InstallNFS, action_root.join("install_nfs")
    end
  end
end
