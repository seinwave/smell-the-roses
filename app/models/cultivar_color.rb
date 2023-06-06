class CultivarColor < ApplicationRecord
    enum :approximate_color, {0: 'white', 1: 'yellow', 2: 'red', 3: 'purple', 4: 'pink', 5: 'orange', 6: 'striped'}
    belongs_to :cultivar
end