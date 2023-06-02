require 'google_custom_search_api'
require 'rails_dominant_colors'
require 'csv'
 
cultivars = Cultivar.all

def filter_out_invalid_links(item)
  !check_is_webp(item.link) && !check_is_spotify(item.link) 
end

def check_is_webp(link)
  link.split('.')[-1] == 'webp'
end

# shopify links don't work
def check_is_spotify(link)
    uri = URI(link)
    puts uri
    host = uri.host
    return host == 'cdn.shopify.com' || host == 'shopify.com'
end


#todo: how to keep writing to file, and resume scraping from last sucessfully scraped one

cultivars.each do |cultivar|

    puts 'CULTIVAR, ID:', cultivar.name, cultivar.id
    
    results = GoogleCustomSearchApi.search("rose #{cultivar.name}", {searchType: "image"})
    safe_link = results["items"].detect{|item| filter_out_invalid_links(item) }.link

    puts "LINK:", safe_link

    colors = RailsDominantColors.url(safe_link, 5)

    puts "COLORS:", colors

    colors.to_hsl.delete_if { |color| color[0] > 60 && color[0] < 180 }

    hsl_colors = colors.to_hsl

    output_path = './script/rose-colors.csv'
    CSV.open(output_path, "wb") do |csv|
        csv << ["cultivar_name", "cultivar_id", "color_0", "color_1", "color_2", "image_link"]
        csv << [cultivar.name, cultivar.id, hsl_colors[0], hsl_colors[1], hsl_colors[2], safe_link]
    end

end
