require 'km_everything'

describe KmEverything::KmEvent do
  let(:km_event) { KmEverything::KmEvent.new(controller_name, action_name) }

  describe "#event" do
    before do
      KmEverything.event_names = { "users" => { "show" => "Viewed User Page" } }
    end

    context "when the controller name is present" do
      let(:controller_name) { "users" }

      context "when the action name is present" do
        let(:action_name) { "show" }

        it "returns the event name" do
          km_event.event.should == "Viewed User Page"
        end
      end

      context "when the action name is not present" do
        let(:action_name) { "create" }

        context "when the app is configured to record all controller actions" do
          before do
            KmEverything.record_every_controller_action = true
          end

          it "returns the controller and action name" do
            km_event.event.should == "users#create"
          end
        end

        context "when the app is configured to NOT record all controller actions" do
          before do
            KmEverything.record_every_controller_action = false
          end

          it "does not return an event name" do
            km_event.event.should be_nil
          end
        end
      end
    end

    context "when the controller name is not present" do
      let(:controller_name) { "some_other_controller" }
      let(:action_name) { "some_other_action" }

      context "when the app is configured to record all controller actions" do
        before do
          KmEverything.record_every_controller_action = true
        end

        it "returns the controller and action name" do
          km_event.event.should == "some_other_controller#some_other_action"
        end
      end

      context "when the app is configured to NOT record all controller actions" do
        before do
          KmEverything.record_every_controller_action = false
        end

        it "does not return an event name" do
          km_event.event.should be_nil
        end
      end
    end
  end
end
