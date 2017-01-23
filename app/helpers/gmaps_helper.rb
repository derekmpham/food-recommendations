module GmapsHelper
	def google_map(center)
		"https://maps.googleapis.com/maps/api/staticmap?center=\"#{center}\"&size=300x300&zoom=17&markers=color:red\|\"#{center}\"&key=#{ENV["GOOGLE_MAPS_GEOCODING_KEY"]}"
	end
end