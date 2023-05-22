FactoryBot.define do
  
  factory :admin_user do
    username "matt"
    email "mseidholz@gmail.com"
    is_admin true
  end 

  factory :regular_user do
    username "Joe"
    email "joe@gmail.com"
    is_admin false
  end 

  factory :plant do
    location_x 1
    location_y 1
    is_deleted false
    form 0
    cultivar_id 1
  end
end