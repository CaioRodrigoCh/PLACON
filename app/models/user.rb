class User < ApplicationRecord
  enum status: %i[em_analise aguardando inativo ativo]
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  has_many :bookmarks
  has_many_attached :file


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[twitter]

  validates :name, presence: true, length: {maximum: 50}

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image.gsub!("_normal", "") # assuming the user model has an image
      user.uid = auth.uid
      user.provider = auth.provider

    end
  end

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      nil
    end
  end
end
