class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :article_times, dependent: :destroy
  has_many :achievements
end
