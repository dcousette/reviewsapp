require 'rails_helper'

describe Review do 
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:restaurant_id) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user) }
end
