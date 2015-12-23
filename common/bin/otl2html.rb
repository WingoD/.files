#!/usr/bin/env ruby

require 'rubygems'
require 'htmlentities'
coder = HTMLEntities.new

last_indent = 0
indent = 0
puts "<ul>"
File.open(ARGV[0]).readlines.each{|line|
	next if line[/^$/]
	indent = line[/^\t*/].size
	while indent < last_indent # we are unindenting
		last_indent -= 1
		puts "</ul>"
	end
	while indent > last_indent # we are unindenting
		last_indent += 1
		puts "<ul>"
	end
	puts "<li>#{coder.encode(line, :named)}</li>"
}
puts "</ul>"
