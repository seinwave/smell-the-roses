require 'json'


# read all the file names in the script/sector dir

# if a filename corresponds to a Sector name, ignore it

# otherwise, input the data into the database

dir_name = "script/sectors"



Dir.children(dir_name).each do |file_name|
    failed = []
    cultivar_names_to_add = []

    # FIRST: create the sector, if it doesn't exist
    data = JSON.parse(File.read(File.join(dir_name, file_name)))
    sector = data['features'].select {|feature| feature['properties']['Name'] =~ /[a-z][0-9]-sector/}
 
    if(sector.empty?)
        puts "sector #{sector} not found"
        next
    end

    sector_name = sector[0]['properties']['Name'].gsub("-sector", "").gsub("\n", "")

    if Sector.find_by(name: sector_name).present? && Sector.find_by(name: sector_name).geojson_string.nil?
        Sector.find_by(name: sector_name).update(geojson_string: sector.to_s)
        next
    elsif Sector.find_by(name: sector_name).present?
        next 
    end

    Sector.create(
        name: sector_name,
        coordinates: sector[0]['geometry']['coordinates'],
        geojson_string: sector.to_s)


    # SECOND: create plant entries for each plant in the sector
    data['features'].each do |feature| 

        # skip if the feature is a sector
        next if feature['properties']['Name'] =~ /[a-z][0-9]-sector/

        name = feature['properties']['Name'].gsub("\n", "")

        cultivar = Cultivar.where("name ILIKE ?", "%#{name}%").first
        sector_id = Sector.find_by(name: sector_name).id

        if cultivar.nil?    
            #don't remember why i'm doing this
            feature['properties']['Name'] = name
            failed << plant
            cultivar_names_to_add << name
            next 
        end 

        cultivar_id = cultivar.id

        puts "Creating plant #{name}"

        Plant.create(
            cultivar_id: cultivar_id,
            #TODO: should i reverse these coordinates?
            latitude: feature['geometry']['coordinates'][1],
            longitude: feature['geometry']['coordinates'][0],
            sector_id: sector_id
        )
        
    end
   
end


# append each failed item to the failed file, without overwriting existing entries
File.open("script/failed.json", "a") do |f|
    f.write(failed.to_json)
end

# append each missing cultivar name to the cultivars_to_add file, without overwriting existing entries
File.open("script/cultivars_to_add.json", "w") do |f|
    f.write(cultivar_names_to_add.to_json)
end




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

