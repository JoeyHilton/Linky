require 'rails_helper'

RSpec.describe Link, :type => :model do
  describe 'work with links' do
    subject { create(:link) }

    it 'should have a title' do
      subject.title = ' '
      assert subject.invalid?
    end

  end
end
