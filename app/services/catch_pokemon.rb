class Pokemon
  def self.get_pokemon
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon-species/cubone')
  end
end