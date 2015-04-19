require 'rails_helper'

RSpec.describe MyJob, type: :job do
  describe 'perform(message)' do
    it 'should invoke Task#exec() with the message' do
      message = 'hoge'
      expect_any_instance_of(Task).to receive(:exec).with(message)
      MyJob.new.perform(message)
    end
  end
end
