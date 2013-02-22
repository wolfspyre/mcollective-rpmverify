module MCollective
  module Agent
    class Rpmverify < RPC::Agent
      metadata :name => "RPM Verification",
        :description => "Verify that all files in an RPM match the md5 stored in the RPMDB",
        :author      => "Wolf Noble",
        :license     => "Apache License, Version 2.0",
        :version     => "0.0003",
        :url         => "https://github.com/wolfspyre/mcollective-rpmverify",
        :timeout     => 10

      action "verify" do
        validate :package, String
        package = request[:package]
        reply["output"] = run("/bin/rpm -Vv #{package} | /bin/egrep -v '^\.\.\.\.\.\.'", :stdout => :output, :chomp => true )
      end
    end
  end
end