class Link < ActiveRecord::Base
  belongs_to :user

  def upvote
    self.votes += 1
    self.save
  end

  def downvote
    self.votes -= 1
    self.save
  end
end
