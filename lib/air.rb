require "active_record"

module Air
  class Airport < ActiveRecord::Base
    has_many :planes
  end

  class Plane < ActiveRecord::Base
    has_many :passengers
    belongs_to :airports
  end

  class Passenger < ActiveRecord::Base
    belongs_to :planes
  end
end
