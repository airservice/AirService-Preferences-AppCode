require "fileutils"
require "appcode_prefs/installation"
require "appcode_prefs/installation_payload"
require "appcode_prefs/commands/symlink"
require "appcode_prefs/commands/unsymlink"
require "appcode_prefs/commands/backups/backup"
require "appcode_prefs/commands/backups/restore"
require "appcode_prefs/commands/backups/file"

source_location   = File.join(File.dirname(File.expand_path(__FILE__)), "..", "appCodeXX")
options           = Dir[File.join(source_location, "options", "**", "*")].map { |file| file.gsub %r{.*/(options.*)}, '\1' }
target_location   = ENV['TARGET_DIR'] || Dir[File.expand_path(File.join("~", "Library", "Preferences", "appCode*"))].last

installation_payload = AppcodePrefs::InstallationPayload.new(
  target_location: target_location,
  source_location: source_location,
  files_to_install: [
    "keymaps",
    "codestyles",
    "templates",
  ] + options,
)

AppcodePrefs::Installation.new(
  installation_payload: installation_payload,
  install_commands: [
    AppcodePrefs::Commands::Backups::Backup.new,
    AppcodePrefs::Commands::Symlink.new
  ],
  uninstall_commands: [
    AppcodePrefs::Commands::Unsymlink.new,
    AppcodePrefs::Commands::Backups::Restore.new
  ]
).send(ARGV.first)
