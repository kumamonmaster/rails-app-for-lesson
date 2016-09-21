class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :body, presence: true

  def favorited_by? user
    favorites.where(user_id: user.id).exists?
  end
end
