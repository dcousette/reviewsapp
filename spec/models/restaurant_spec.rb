require 'rails_helper'

describe Restaurant do 
  it { should belong_to(:category) }
  it { should have_many(:reviews) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  
  describe "#review_exists_already?" do 
    it "returns true if a review exists by the passed in user" do 
      yums = Fabricate(:restaurant)
      me = Fabricate(:user)
      Review.create(rating: 2, content: "So so.", restaurant: yums, user: me)
      expect(yums.review_exists_already?(me)).to eq(true)
    end
  end 
end