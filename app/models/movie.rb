class Movie < ApplicationRecord
	 mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy

  validate :like , :checlike
  validate :like , :checdislike

  def checlike
    self.like = 0
    
  end
  def checdislike

    self.dislike = 0
    
  end


end
