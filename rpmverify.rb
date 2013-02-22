module MCollective
  module Agent
    class Rpmverify < RPC::Agent
      metadata 
        :name        => "RPM Verification",
        :description => "Verify that all files in an RPM match the md5 stored in the RPMDB",
        :author      => "Wolf Noble",
        :license     => "Apache License, Version 2.0",
        :version     => "0.0001",
        :url         => "https://github.com/",
        :timeout     => 10      

      action "verify" do
        validate :package, String
        package = request[:package]
        run("/bin/rpm -Vv #{package} | /bin/egrep -v '^\.\.\.\.\.\.'", :stdout => :output, :chomp => true, :stderr => :output)
        reply[:output] = "bacon"
      end
    end
  end
end