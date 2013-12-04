require "appcode_prefs/commands/symlink"

module AppcodePrefs
  module Commands
    describe Symlink do
      describe "#execute" do
        it "symlinks all files to install into the target" do
          installation_bundle = [
            double(:installation_pair,
              source: "/source/foo/bar",
              target: "/baz/foo/bar"
            )
          ]

          filesystem = double :filesystem

          filesystem.should_receive(:symlink).with("/source/foo/bar", "/baz/foo/bar")

          Symlink.new(filesystem: filesystem).execute(installation_bundle)
        end
      end
    end
  end
end
