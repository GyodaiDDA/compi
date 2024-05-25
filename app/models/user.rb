class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :account_type, { patient: 5, professional: 10 }

  def authorized?(permited_account_types)
    permited_account_types.include?(account_type.to_sym)
  end
end
