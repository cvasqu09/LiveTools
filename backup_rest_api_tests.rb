require 'mongo'

class RestTestBackup
	def self.backup(path_to_xml)
		db = Mongo::Client.new(['127.0.0.1:27017'], :database => 'SoapBackups')
		grid = Mongo::Grid::FSBucket.new(db)

		project_file = File.open(path_to_xml)

		timestamp = Time.now.strftime("%d_%m_%Y_%H_%M")
		grid.upload_from_stream("rest_backup_#{timestamp}.xml", project_file)
	end

	def self.download_backup(filename_to_download, path_to_save)
		db = Mongo::Client.new(['127.0.0.1:27017'], :database => 'SoapBackups')
		grid = Mongo::Grid::FSBucket.new(db)

		download_stream = grid.open_download_stream_by_name(filename_to_download)
		file = File.open(path_to_save, "w+")
		file.write(download_stream.read)
		file.close
	end
end



