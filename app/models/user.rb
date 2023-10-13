# frozen_string_literal: true

# User model
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  enum role: { customer: 0, admin: 1 }
  has_many :tasks, inverse_of: 'author', foreign_key: 'author_id', dependent: :destroy

  def jwt_payload
    super.merge('email' => email)
         .merge('role' => role)
  end
end
