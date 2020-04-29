class Api::V1::SubscriptionsController < Api::V1::BaseController
  ## API to list all subscription information ##
  def index
    begin
      response = []
      SubscriptionMaster.all.each do |subscription|
        response << {
          id: subscription.id,
          subscription_id: subscription.subscription_id,
          price: subscription.price,
          stars: subscription.stars
        }
      end
      render_object_success(response, 'Listing Subscription', 200, 'Subscription')
    rescue Exception => e
      render_error('unknown', e.message)
    end
  end
end
