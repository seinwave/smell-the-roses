FactoryBot.define do
  factory :plant do
    location_x { 1 }
    location_y { 1 }
    is_deleted { false }
    form { 0 }
    cultivar
  end
end
