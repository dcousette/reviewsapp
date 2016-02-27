require 'rails_helper'

describe Category do
  it { should have_many(:restaurants) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:slug) }

  describe "#to_param" do
    it 'returns the slug for the category object' do
      comedy = Fabricator(:category, name: "Comedy", slug: "comedy")
      expect(comedy.to_param).to eq(comedy.slug)
    end
  end
end
