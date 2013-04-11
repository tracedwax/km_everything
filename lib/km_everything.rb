module KmEverything
  class << self
    attr_accessor :record_every_controller_action
    attr_accessor :event_names
    attr_accessor :excluded_names
  end

  class KmEvent < Struct.new(:controller_name, :action_name)
    def event
      unless event_excluded?
        specified_event || unspecified_event
      end
    end

    private

    def specified_event
      controller_actions = KmEverything.event_names[controller_name]
      controller_actions[action_name] if controller_actions
    end

    def unspecified_event
      "#{controller_name}##{action_name}" if KmEverything.record_every_controller_action
    end

    def event_excluded?
      if excluded_names
        if excluded_names[controller_name]
          excluded_names[controller_name].include?(action_name)
        end
      end
    end

    def excluded_names
      KmEverything.excluded_names
    end
  end
end
