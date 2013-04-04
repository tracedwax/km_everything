# km_everything

Log Rails controller actions to KissMetrics

## Requirements
  * Ruby 1.9

## Installation

TBD

## Usage

In config/initializers/km\_everything\_.rb:

  KmEverything.event_names = YAML.load(File.open("path/to/file.yml"))
  KmEverything.record_every_controller_action = true

In config/km\_everything\_.yml:

  controller_1:
    action_1: My Event Name for Action 1

In application_controller.rb:

  after_filter :queue_kissmetrics, if: :user_signed_in?

  def queue_kissmetrics
    event_name = KmEverything::KmEvents.new(controller_name, action_name).event
    KmResque.record(current_user.id, event_name, {}) unless event_name.nil?
  end
