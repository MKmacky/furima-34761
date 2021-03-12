class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :encrypted_password, :password, :password_confirmation,
            format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }

  with_options presence: true do
    validates :nick_name                 

    with_options format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ } do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_kana                          
      validates :last_name_kana
    end

    validates :birthday

  end
end
