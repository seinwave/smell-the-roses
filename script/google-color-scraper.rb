require 'google_custom_search_api'
require 'rails_dominant_colors'
require 'csv'
 
cultivars = Cultivar.all

def filter_out_invalid_links(item)
  link = item.link
  return false if check_is_shopify(link)
  return false if check_is_webp(link)
  return false if check_is_not_https(link)
  return true
end

def check_is_webp(link)
  return link.split('.')[-1] == 'webp'
end

# shopify links don't work (gatekeeping)
def check_is_shopify(link)
    uri = URI(link)
    puts uri
    host = uri.host
    return host == 'cdn.shopify.com' || host == 'shopify.com'
end

def check_is_not_https(link)
  return link.split(':')[0] != 'https'
end

def hsl_to_string(hsl)
  return "" if hsl.nil?
  return "hsl(#{hsl.join(",")})"
end

cultivars.each do |cultivar|

    puts 'CULTIVAR, ID:', cultivar.name, cultivar.id
    #skip if there is already a CultivarColor entry for this cultivar
    next if !CultivarColor.where(cultivar: cultivar).empty?

    results = GoogleCustomSearchApi.search("rose #{cultivar.name}", {searchType: "image"})
    if results["items"].nil? || results["items"].empty?
      puts "NO RESULTS"
      next
    end 

    safe_link = results["items"].detect{|item| filter_out_invalid_links(item) }.link

    next if safe_link.nil?
    next if safe_link == ""

    begin 
      colors = RailsDominantColors.url(safe_link, 5)

    
    rescue => exception
      puts "EXCEPTION:", exception   
      next
    end

    colors = colors.to_hsl.delete_if { |color| color[0] > 60 && color[0] < 180 }


  
    primary_color = hsl_to_string(colors[0])
    accent_color = hsl_to_string(colors[1])

    puts primary_color, accent_color

    CultivarColor.create(cultivar: cultivar, primary_color: primary_color, accent_color: accent_color)


end
