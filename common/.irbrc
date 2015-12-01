require 'rubygems'

begin
  # load wirble
  require 'wirble'

  # start wirble (with color)
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

__END__
require 'irb/completion'
require 'map_by_method'
require 'what_methods'
require 'pp'
IRB.conf[:AUTO_INDENT]=true

