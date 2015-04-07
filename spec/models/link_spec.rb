require 'rails_helper'

RSpec.describe Link, :type => :model do
    subject { create(:link) }
  describe 'Link validations' do
    
    it 'should have a title' do
      subject.title = ' '
      assert subject.invalid?
    end

    it 'should have a url' do
      subject.url = ' '
      assert subject.invalid?
    end
  
  end

  describe 'Upvote and downvote' do
    
    it 'should upvote' do
      expect{ subject.upvote }.to change{subject.votes}.by(1)
    end

    it 'should downvote' do
      expect{ subject.downvote }.to change{subject.votes}.by(-1)
    end
  
  end
end
