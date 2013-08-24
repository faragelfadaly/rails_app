class Post < ActiveRecord::Base
  attr_accessible :text, :title
  
  validates :text, presence: true,
                    length: { minimum: 20 }
  validates :title, presence: true,
                    length: { minimum: 5 }
                   
  has_many :comments, dependent: :destroy
end
