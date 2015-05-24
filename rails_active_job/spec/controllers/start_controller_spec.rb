require 'rails_helper'

RSpec.describe StartController, type: :controller do
  describe '#run()' do
    it 'should enqueue MyJob' do
      time = Time.now
      performed_time = time.since(10.seconds)
      
      travel_to(time) do
        assert_enqueued_with(job: MyJob, args: ['Task exec.']) do
          get :run
        end
        assert_enqueued_with(job: MyJob, args: ['Task exec 1.'], at: performed_time.to_i) do
          get :run
        end
        assert_enqueued_with(job: MyJob, args: ['Task exec 2.'], at: performed_time.to_i) do
          get :run
        end
      end
    end
  end
end
