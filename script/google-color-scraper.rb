require 'google_custom_search_api'

results = GoogleCustomSearchApi.search("rose jude the obscure", {searchType: "image"})
puts results["items"][0]