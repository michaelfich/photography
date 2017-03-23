require 'rails_helper'

RSpec.describe User, type: :model do
  context 'initialized without complete parameters' do
    it 'should not throw any errors' do
      expect { Photo.new }.to_not raise_error
    end
  end
end
