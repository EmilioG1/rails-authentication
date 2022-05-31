require 'rails_helper'

describe Pokemon, :vcr => true do
  it 'returns a 200 success header when the API call is made' do
    response = Pokemon.get_pokemon
    expect(response.code).to(eq(200))
  end

  it "returns happiness when the API call is made" do
    response = Pokemon.get_pokemon
    expect(response["base_happiness"]).to_not(eq(nil))
  end

  it "returns happiness when the API call is made" do
    response = Pokemon.get_pokemon
    expect(response["base_happiness"]).to(eq(50))
  end
end