module KmEverything
  class << self
    attr_accessor :record_every_controller_action
    attr_accessor :event_names
  end

  class KmEvent < Struct.new(:controller_name, :action_name)
    def event
      specified_event || unspecified_event
    end

    private

    def specified_event
      controller_actions = KmEverything.event_names[controller_name]
      controller_actions[action_name] if controller_actions
    end

    def unspecified_event
      "#{controller_name}##{action_name}" if KmEverything.record_every_controller_action
    end
  end
end
