#!/usr/bin/env ruby

# file: myfirmata-plugin-button.rb

# a plugin for the myfirmata gem


class MyFirmataPluginButton


  def initialize(arduino, settings: {}, variables: {})
    
    @arduino = arduino
    @settings, @variables = settings, variables
    
  end
    
  def start()
        
    puts 'ready to detect button'
    
    t = Time.now
    
    notifier = @variables[:notifier]
    topic = @variables[:device_id]
    msg = @settings[:msg] || 'button pressed'
    pinx = @settings[:pin] || 2
    interval = @settings[:interval] || 1

    @arduino.on :digital_read do |pin, high|

      if pin == pinx and high and t + interval < Time.now
        notifier.notice "%s: %s" % [topic, msg]
        t = Time.now
      end

    end

  end  
  
  alias on_start start
  
  
end
