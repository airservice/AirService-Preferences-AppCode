require "pathname"

module Helpers
  def installed_path_to(file_or_dir)
    File.expand_path(File.join(File.dirname(File.expand_path(__FILE__)), "..", "..", "tmp", "AppCode20", file_or_dir))
  end

  def repo_path_to(file_or_dir)
    File.expand_path(File.join(File.dirname(File.expand_path(__FILE__)), "..", "..", "appCode20", file_or_dir))
  end
end

World Helpers

Given(/^AppCode is installed$/) do
  system "rm -rf tmp/AppCode20"
  system "mkdir tmp/AppCode20"
  system "cp -r features/fixtures/PrefsTemplate/* tmp/AppCode20"
end

When(/^the Pivotal Preferences are not already installed$/) do
end

When(/^I run:$/) do |command|
  system("TARGET_DIR=tmp/AppCode20 #{command}")
end

Then(/^the Pivotal Preferences should be installed and take effect when I start AppCode/) do
  Pathname.new(installed_path_to("codestyles")).realpath.should == Pathname.new(repo_path_to("codestyles"))
end

When(/^the Pivotal Preferences are already installed$/) do
  system("TARGET_DIR=tmp/AppCode20 ruby appcodeprefs install")
end

Then(/^the Pivotal Preferences should be uninstalled$/) do
  Pathname.new(installed_path_to("codestyles")).realpath.should == Pathname.new(installed_path_to("codestyles"))
end
