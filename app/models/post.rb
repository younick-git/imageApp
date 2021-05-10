class Post < ApplicationRecord
  belongs_to :album
  include ImageUploader[:image]

  before_save :check_count_validation

  def check_count_validation
    raise_validation_error if Post.where(album_id: self.album_id).count >= 25
  end
end
