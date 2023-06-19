require 'json'


# read all the file names in the script/sector dir

# if a filename corresponds to a Sector name, ignore it

# otherwise, input the data into the database

dir_name = "script/sectors"


Dir.children(dir_name).each do |file_name|
    puts file_name
    data = JSON.parse(File.read(File.join(dir_name, file_name)))
    sector = data['features'].select {|feature| feature['properties']['Name'] =~ /[a-z][0-9]-sector/}
    if(sector.empty?)
        puts "sector #{sector} not found"
        next
    end
    puts sector
    sector_name = sector[0]['properties']['Name'].gsub("-sector", "")
    puts sector_name
end

# File.open(File.join(dir_name, file_name), "r") do |file|

#     puts file

# data = JSON.parse(file)

# # the sector name is the feature with a 'Name' property that matches the regex /[a-z][0-9]-sector/
# sector_name = data['features'].select {|feature| feature['properties']['Name'] =~ /[a-z][0-9]-sector/}
# puts "FILE:", file_name
# puts sector_name
# end 


# sector_b3 = data['features'].select {|feature| feature['properties']['Name'] == "b3-sector"}

# Sector.create(
#     name: "b3",
#     coordinates: sector_b3[0]['geometry']['coordinates'])
    



# data['features'].each do |plant|
#    name = plant['properties']['Name'].gsub("\n", "")

#    name = "marie pavié" if name.include? "marie par"

#    name = "frau karl druschki" if name.include? "frau"

#    next if name.include? "b3"
   
#    cultivar = Cultivar.where("name ILIKE ?", "%#{name}%").first
#    sector_id = Sector.find_by(name: "b3").id

   

#    if cultivar.nil?
#         plant['properties']['Name'] = name
#         failed << plant
#         cultivar_names_to_add << name
#         next
#    end 

#    cultivar_id = cultivar.id

#    puts "creating plant #{name}"

#    Plant.create(
#          cultivar_id: cultivar_id,
#          latitude: plant['geometry']['coordinates'][1],
#          longitude: plant['geometry']['coordinates'][0],
#          sector_id: sector_id
#    )

# end 


# # append each failed item to the failed file, without overwriting existing entries
# File.open("script/failed.json", "a") do |f|
#     f.write(failed.to_json)
# end

# # append each missing cultivar name to the cultivars_to_add file, without overwriting existing entries
# File.open("script/cultivars_to_add.json", "w") do |f|
#     f.write(cultivar_names_to_add.to_json)
# end

