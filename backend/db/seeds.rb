# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'csv'

csv_text = File.read(Rails.root.join('pokemon.csv'))

csv = CSV.parse(csv_text, headers: true, encoding: 'utf-8')
count = 0
Pokemon.transaction do
	csv.each do |row|
		image_path = Rails.root.join('app', 'assets', 'images', 'pokemons', "#{row['Name']}.jpg")

		if File.exist?(image_path)
			pok = Pokemon.create!(
				poke_index: row['#'].to_i,
				name: row['Name'],
				type_1: row['Type 1'],
				type_2: row['Type 2'],
				total: row['Total'].to_i,
				hp: row['HP'].to_i,
				attack: row['Attack'].to_i,
				defense: row['Defense'].to_i,
				speed_attack: row['Sp. Atk'].to_i,
				speed_defense: row['Sp. Def'].to_i,
				speed: row['Speed'].to_i,
				generation: row['Generation'].to_i,
				legendary: row['Legendary'].downcase == 'false' ? false : true
			)

			pok.image.attach(
				io: File.open(image_path),
				filename: "#{row['Name']}.jpg",
				content_type: "image/jpg"
			)

			count += 1
			puts "#{count} - #{pok.name}"
		end
	end
end

puts "#{count} pokemons saved!"