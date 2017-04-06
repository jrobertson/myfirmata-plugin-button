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
    triggers = @settings[:event_triggers] || @settings[:trigger_events] || 1

    interval = if triggers == 1 then
      @settings[:interval] || 1
    else
      @settings[:interval] || 0.1
    end

    @arduino.on :digital_read do |pin, pressed|
      
      if pin == pinx and t + interval < Time.now then
        
        if triggers == 1 then
          notifier.notice "%s: %s" % [topic, msg] if pressed
        else
          state = pressed ? 'down' : 'up'
          notifier.notice "%s: button %s" % [topic, state]
        end
        
        t = Time.now
        
      end
    end

  end  
  
  alias on_start start
    
end