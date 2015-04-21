class Value < ActiveRecord::Base
  def self.create_values
    100.times do |i|
      self.create(value: "value: #{i}")
    end
  end
end
