require 'json'


# read all the file names in the script/sector dir

# if a filename corresponds to a Sector name, ignore it

# otherwise, input the data into the database

dir_name = "script/sectors"

def get_sector_name(sector)
    return sector[0]['properties']['Name'].gsub("-sector", "").gsub("\n", "")
end

def create_sector(sector)
    sector_name = get_sector_name(sector)
    if sector.empty?
        puts 'sector not found'
        return 
    elsif Sector.find_by(name:name).present?
        puts 'sector already exists'
        return
    else Sector.create(
            name: name,
            coordinates: sector[0]['geometry']['coordinates'],
            geojson_string: sector.to_s)
            puts 'sector created, starting plant loop'
    end

end 



Dir.children(dir_name).each do |file_name|
    failed = []
    cultivar_names_to_add = []

    puts 'READING SECTOR FILE', file_name

    # FIRST: create the sector, if it doesn't exist
    data = JSON.parse(File.read(File.join(dir_name, file_name)))
    sector = data['features'].select {|feature| feature['properties']['Name'] =~ /[a-z][0-9]-sector/}
    
    create_sector(sector)

    sector_name = get_sector_name(sector)
  
    # SECOND: create plant entries for each plant in the sector
    data['features'].each do |feature| 

        puts 'PROCESSING FEATURE', feature['properties']['Name']

        # skip if the feature is a sector
        next if feature['properties']['Name'] =~ /[a-z][0-9]-sector/

        name = feature['properties']['Name'].gsub("\n", "")

        cultivar = Cultivar.where("name ILIKE ?", "%#{name}%").first
        sector_id = Sector.find_by(name: sector_name).id

        if cultivar.nil?
            puts "Cultivar not found for #{name} -- creating entry in PlantFailures table"
            PlantFailure.create(
                name: name,
                longitude: feature['geometry']['coordinates'][0],
                latitude: feature['geometry']['coordinates'][1],
                sector_id: sector_id
            )    
            next 
        end 

        cultivar_id = cultivar.id

        # if the plant already exists (same lat and long), skip it
        if Plant.find_by(latitude: feature['geometry']['coordinates'][1], longitude: feature['geometry']['coordinates'][0]).present?
           puts "PLANT ALREADY EXISTS, SKIPPING #{name}"
           next 
        end

        puts "Creating plant #{name}"

        Plant.create(
            cultivar_id: cultivar_id,
            latitude: feature['geometry']['coordinates'][1],
            longitude: feature['geometry']['coordinates'][0],
            sector_id: sector_id
        )
    end
end

