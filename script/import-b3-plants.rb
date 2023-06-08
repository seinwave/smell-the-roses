require 'json'

file = File.read('script/b3.geojson')

data = JSON.parse(file)

pre_count = data['features'].uniq.count




failed = []
cultivar_names_to_add = []

data['features'].each do |plant|
   name = plant['properties']['Name'].gsub("\n", "")

   name = "marie pavié" if name.include? "marie par"

   name = "frau karl druschki" if name.include? "frau"

   next if name.include? "b3"
   
   cultivar = Cultivar.where("name ILIKE ?", "%#{name}%").first

   if cultivar.nil?
        plant['properties']['Name'] = name
        failed << plant
        cultivar_names_to_add << name
        next
   end 

   Plant.create(
         cultivar_id: cultivar.id,
         latitude: plant['geometry']['coordinates'][1],
         longitude: plant['geometry']['coordinates'][0],
         sector: "b3"
   )

end 


# write each failure to json file
File.open("script/b3-failed.json","w") do |f|
    f.write(failed.to_json)
end

File.open("script/cultivars_to_add.json", "w") do |f|
    f.write(cultivar_names_to_add.to_json)
end

