class Plant < ApplicationRecord
<<<<<<< Updated upstream
   enum status: { groundcover: 0, shrub: 1, rambling: 2, climbing: 3 }
      belongs_to :plant
=======
  enum status: { groundcover: 0, shrub: 1, rambling: 2, climbing: 3 }
  belongs_to :plant
  has_many :plant_statuses
  has_many :photos
>>>>>>> Stashed changes
end
