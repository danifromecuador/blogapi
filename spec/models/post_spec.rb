require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'validates presence of required fields' do
      should validate_presence_of(:user_id)
      should validate_presence_of(:title)
      should validate_presence_of(:content)
      should validate_presence_of(:published)
    end

    it 'validates relations' do
      should belong_to(:user)
    end
  end
end
