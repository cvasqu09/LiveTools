require_relative './backup_rest_api_tests'
require 'byebug'

namespace :rest_backups do
	desc 'Backups rest test xml file to mongo'
	task :backup, [:path] do |_,args|
		RestTestBackup.backup(args[:path])
	end

	desc 'Downloads a specified backup to the given save path'
	task :download_backup, [:backup_name,:save_path] do |_, args|
		puts "Entering download"
		RestTestBackup.download_backup(args[:backup_name], args[:save_path])
		puts "downloaded"
	end
end