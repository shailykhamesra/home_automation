require File.expand_path(I18n.t 'env', __FILE__)

loop do
  controls = Control.where(automated: true)
  for control in controls
    if control.configure.strftime("at %I:%M%p") == Time.now.strftime("at %I:%M%p")
      puts "control #{control.id} on"
    end

    if control.configureoff.strftime("at %I:%M%p") == Time.now.strftime("at %I:%M%p")
      puts "control #{control.id} off"
    end

  end
end