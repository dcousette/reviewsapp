require 'rails_helper'

describe Category do
  it { should have_many(:restaurants) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  # describe "#to_param" do
  #   it 'returns the slug for the category object' do
  #     comedy = Fabricator(:category)
  #     expect(comedy.to_param).to eq(comedy.slug)
  #   end
  # end

  describe "#generate_slug" do
    it ''
  end
end
