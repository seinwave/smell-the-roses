class PlantStatus < ApplicationRecord
      enum :status, { peak: 0, budding:1, blooming: 2, dormant:3 }
      belongs_to :plant

      # def status_word
      #   PlantStatus.statuses.key(status_type).to_s
      # end 
end
