module VagrantPlugins
  module GuestFreeBSD
    module Cap
      class Halt
        def self.halt(machine)
          begin
            machine.communicate.sudo("shutdown -p now", { shell: "sh" })
          rescue IOError
            # Do nothing because SSH connection closed and it probably
            # means the VM just shut down really fast.
          end
        end
      end
    end
  end
end
