require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'respond_to' do
    it {is_expected.to respond_to(:title)}
    it {is_expected.to respond_to(:description)}
  end

  context 'validations' do
    it {is_expected.to validate_presence_of(:title)}
    it {is_expected.to validate_presence_of(:description)}
  end
end
