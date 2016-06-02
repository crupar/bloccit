require 'rails_helper'

RSpec.describe Advertisement, type: :model do

  let(:advertisement) { Advertisement.create!(title: "Random Advertisement", body: "This is the body.", price: (1000)) }

  describe "attributes" do
    it "has title, body and price" do
      expect(advertisement).to have_attributes(title: "Random Advertisement", body: "This is the body.", price: (1000))
    end
  end

end
