#!/usr/bin/env ruby 

require 'rubygems'
require 'net/ssh'
require 'net/sftp'


host = "192.168.1.15"
usuario = "testuser"
clave = 'sd43#$'
fecha = ''
remote_path = '/export/home/testuser/data.'+ fecha +'.tar.bz2'
local_path = '/home/localuser/data/data.' + fecha + '.tar.bz2'


class CustomHandler
  def on_open(downloader, file)
    puts "Iniciando descarga: #{file.remote} -> #{file.local} (#{file.size} bytes)"
  end

  def on_get(downloader, file, offset, data)
    puts "Escribiendo data #{data.length} bytes de #{file.local} iniciando en #{offset}"
  end

  def on_close(downloader, file)
    puts "Finalizando la descarga de #{file.remote}"
  end

  def on_mkdir(downloader, path)
    puts "Creando directorio  #{path}"
  end

  def on_finish(downloader)
    puts "Descarga completada!"
  end
end

Net::SFTP.start(host, usuario, :password => clave) do |sftp|
	sftp.download!(remote_path, local_path, :progress => CustomHandler.new)
end

#Net::SFTP.start(host, usuario, :password => clave) do |sftp|
#	# download = sftp.download( remote_path, local_path)
#	# download.wait()
#  sftp.download!(remote_path, local_path) do |event, downloader, *args|
#    case event
#    when :open then
#      # args[0] : file metadata
#      puts "starting download: #{args[0].remote} -> #{args[0].local} (#{args[0].size} bytes}"
#    when :get then
#      # args[0] : file metadata
#      # args[1] : byte offset in remote file
#      # args[2] : data that was received
#      puts "writing #{args[2].length} bytes to #{args[0].local} starting at #{args[1]}"
#    when :close then
#      # args[0] : file metadata
#      puts "finished with #{args[0].remote}"
#    when :mkdir then
#      # args[0] : local path name
#      puts "creating directory #{args[0]}"
#    when :finish then
#      puts "all done!"
#    end
#  end
#end


