class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-zA-Z])(?=.*?[\d])\w{6,100}\z/

  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: ". Include both letters and numbers"}

  with_options presence: true, format: { with: VALID_ZENKAKU_REGEX, message: ". Input full-width characters"} do
    validates :last_name, presence: true
    validates :first_name, presence: true
  end

  with_options presence: true, format: { with: VALID_KATAKANA_REGEX, message: ". Input full-width katakana characters"} do
    validates :last_name_kana
    validates :first_name_kana
  end
  
  validates :birth_date, presence: true

end
