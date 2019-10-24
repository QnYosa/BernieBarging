
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
Entity.destroy_all


# création de ville (5 pour débuter)
5.times do
	City.create(city_name:Faker::Address.city)
end

# on crée des chiens aux noms de super heros
120.times do
	Dog.create(name:Faker::DcComics.hero, city_id:City.all.sample.id)	
end

# on crée des dogsitters aux noms d'humains 
30.times do
	Dogsitter.create(name:Faker::Name.name, city_id:City.all.sample.id)	
end

100.times do
		Stroll.create(date:Faker::Date.in_date_period, dogsitter_id:Dogsitter.all.sample.id)
end

# Generation choix des chiens selon la ville du Dogsitter de la stroll

200.times do
		stroll = Stroll.all.sample
		Entity.create(stroll_id: stroll.id, dog_id: Dog.where(city_id: Dogsitter.find(stroll.dogsitter_id).city_id).sample.id)
end