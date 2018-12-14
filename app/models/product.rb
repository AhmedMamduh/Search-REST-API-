class Product < ApplicationRecord

	def self.text_search(query)
		if query.present?
			where("product_name @@ :q", q: query)
		end
	end
	
end
