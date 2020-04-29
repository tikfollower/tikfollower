class User < ApplicationRecord
  ## Associations ##
  has_many :user_subscriptions, dependent: :destroy
end
