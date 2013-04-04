# km_everything

Log Rails controller actions to KissMetrics

## Requirements
  * Ruby 1.9

## Installation

TBD

## Usage

In config/initializers/km\_everything\_.rb:

  KmEverything.event_names = YAML.load(File.open(Rails.root+"config/km_everything.yml"))
  KmEverything.record_every_controller_action = true

In config/km\_everything\_.yml:

controller_1:
  action_1: My Event Name for Action 1

In application_controller.rb:

  after_filter :queue_kissmetrics

  def queue_kissmetrics
    KmResque.record(identifier, event_name, {}) unless event_name.nil?
  end
