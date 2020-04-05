require 'daemons'
Daemons.run('process/automatic.rb', log_output: true)