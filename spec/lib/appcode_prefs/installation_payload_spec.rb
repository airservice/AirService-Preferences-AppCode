require "appcode_prefs/installation_payload"

module AppcodePrefs
  describe InstallationPayload do
    describe "#target_files" do
      it "returns the target install location of all the source files to install" do
        InstallationPayload.new(
          target_location: "/target",
          source_location: "/source",
          files_to_install: ["/install_file"]
        ).target_files.should == ["/target/install_file"]
      end
    end

    describe "#each" do
      it "returns the source and destination files for installation" do
        installation_pair = InstallationPayload.new(
          target_location: "/target",
          source_location: "/source",
          files_to_install: ["/install_file"]
        ).first

        installation_pair.target.should == "/target/install_file"
        installation_pair.source.should == "/source/install_file"
      end
    end
  end
end
