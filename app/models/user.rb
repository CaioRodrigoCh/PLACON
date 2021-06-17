class User < ApplicationRecord
  enum status: %i[em_analise aguardando inativo ativo]
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  has_many :bookmarks
  has_many_attached :file

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :name, presence: true, length: {maximum: 50}


  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      nil
    end
  end
end
