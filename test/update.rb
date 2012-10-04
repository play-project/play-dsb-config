#!/usr/bin/env ruby
# coding: utf-8

require 'fileutils'

puts '[PLAY] Configuring DSB TEST'

fail 'Please set DSB_TEST environment variable!' if !ENV['DSB_TEST']

dsb = ENV['DSB_TEST']
puts "[PLAY] Target DSB is under #{dsb}"
conf = File.join(dsb, "conf")

# backup old configuration
backup = File.join(dsb, 'backup')
backup_conf = File.join(backup, Time.now.strftime("%Y%m%d-%H:%M:%S"))
puts "[PLAY] Backup old configuration files to #{backup_conf}"
FileUtils.mkdir_p backup_conf, :verbose => true
FileUtils.cp_r conf, backup_conf, :verbose => true

puts "[PLAY] Pushing new files to #{conf}"
# Copying local repository files to target
FileUtils.cp_r 'conf/.', conf, :verbose =>true

puts "[PLAY] Done! Please restart the DSB..."

