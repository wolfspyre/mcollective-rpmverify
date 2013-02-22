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
        validate :message, String
        message = request[:message]
        run("/bin/rpm -Vv #{message} | /bin/egrep  -v \.\.\.\.\.\.\.\.", :stdout => :out, :stderr => :err)
        reply["status"] = "test output"
      end
    end
  end
end