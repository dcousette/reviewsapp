require 'rails_helper'

describe Restaurant do 
  it { should belong_to(:category) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:category) }
end