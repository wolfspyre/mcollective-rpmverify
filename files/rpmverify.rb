module MCollective
  module Agent
    class Rpmverify < RPC::Agent
      metadata :name => "RPM Verification",
        :description => "Verify that all files in an RPM match the md5 stored in the RPMDB",
        :author      => "Wolf Noble",
        :license     => "Apache License, Version 2.0",
        :version     => "0.2",
        :url         => "https://github.com/wolfspyre/mcollective-rpmverify",
        :timeout     => 10

      action "verify" do
        validate :package, String
        package = request[:package]
        foo=""
        out = run("if [ `/bin/rpm -qa|grep #{package}|wc -l` -gt 0 ]; then /bin/rpm -Vv #{package} |/bin/egrep -v '^\\.{8}';else echo 'Package #{package} not installed';fi  ",:stdout => foo , :chomp => true)
        if foo.empty?
          foo="No Deviation"
        end
        reply["output"] = foo
      end
    end
  end
end