class UserSubscription < ApplicationRecord
  ## Associations ##
  belongs_to :user
  belongs_to :subscription_master
end
