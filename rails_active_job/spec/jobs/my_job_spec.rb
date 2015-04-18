require 'rails_helper'

RSpec.describe MyJob, type: :job do
  describe 'perform(message)' do
    it 'should invoke Task#exec(message)' do
      allow_any_instance_of(Task).to receive(:exec)
      MyJob.perform_later('Task exec.')
    end
  end
end
