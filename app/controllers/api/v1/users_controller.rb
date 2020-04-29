class Api::V1::UsersController < Api::V1::BaseController
  ## API to save user tiktok_username ##
  def guest_sign_in
    begin
      if params[:tiktok_username].present?
        @user = User.find_or_initialize_by(tiktok_username: params[:tiktok_username])
        if @user.save
          response = {
            id: @user.id,
            tiktok_username: @user.tiktok_username,
            total_count_stars: @user.total_count_stars || 0
          }
          render_object_success(response, 'User Detail', 200, 'User')
        else
          render_error('unknown', @user.errors.full_messages.join(', '))
        end
      else
        render_error('missing_params', 'Parameter Missing')
      end
    rescue Exception => e
      render_error('unknown', e.message)
    end
  end

  ## API to add user's subscription details ##
  def add_subscription_info
    begin
      if params[:user_id].present? && params[:subscription_id].present?
        @user = User.find_by(id: params[:user_id])
        if @user.user_subscriptions.create(subscription_master_id: params[:subscription_id])
          @user.update(total_count_stars: (@user.total_count_stars || 0) + @user.user_subscriptions.last.subscription_master.stars.to_i)
          render_message('Subscription info added for user')
        else
          render_error('unknown', @user.errors.full_messages)
        end
      else
        render_error('missing_params', 'Parameter Missing')
      end
    rescue Exception => e
      render_error('unknown', e.message)
    end
  end
end
