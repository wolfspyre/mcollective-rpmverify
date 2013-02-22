metadata :name        => "RPM Verification",
         :description => "Verify that all files in an RPM match the md5 stored in the RPMDB",
         :author      => "Wolf Noble",
         :license     => "Apache License, Version 2.0",
         :version     => "0.0001",
         :url         => "https://github.com/wolfspyre/mcollective-rpmverify",
         :timeout     => 10

action "verify", :description => "display the files which deviate from the RPM database information" do
    display :always

    input :message,
          :prompt      => "Package",
          :description => "The package to verify",
          :type        => :string,
          :validation  => '.',
          :optional    => false,
          :maxlength   => 140

    output :status,
           :description => "The deviations from the rpm verify",
           :display_as  => "Package Deviations"
end