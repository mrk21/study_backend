class Value < ActiveRecord::Base
  has_one :info, dependent: :destroy
  accepts_nested_attributes_for :info
  
  def self.create_values
    10.times do |i|
      self.create(value: "value: #{i}", info_attributes: {data: "data: #{i}"})
    end
  end
end
