class Responder < ActiveRecord::Base
	self.inheritance_column = nil

	validates :type, :name, :capacity, presence: true
	validates_uniqueness_of :name
	validates_inclusion_of :capacity, :in => 1..5
	
	def as_json(options = {})
    {
      emergency_code: self.emergency_code,
      type: self.type,
      name: self.name,
      capacity: self.capacity,
      on_duty: self.on_duty
    }
	end
end
