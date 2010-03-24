module Spree::QuickPolls::BaseControllerExtends
  def self.included(controller)
    controller.append_before_filter :define_poll
    controller.append_before_filter :record_vote
  end

  def define_poll
    @vote = Vote.new
    @poll = get_current_poll
    if current_user && @poll 
      @current_user_vote = current_user.get_user_vote(@poll.id)
    end
  end

  def get_current_poll
    # TODO: Change to sort_by created_date later
    current_user.roles.collect { |r| r.polls }.flatten.sort_by { |p| p.id }.first if current_user && current_user.roles
  end

  def record_vote
    if params[:vote]
      if params[:vote][:poll_option_id] == 'free_form'
        @poll = get_current_poll
        @vote = FreeFormVote.new({ :poll_id => @poll.id, :value => params[:free_form_value] }) if @poll 
      else
        @vote = Vote.new({ :poll_option_id => params[:vote][:poll_option_id] })
      end
      @vote.update_attributes({ :user_id => current_user.id, :ip_address => request.remote_ip, :voted_at => Time.now })
      # TODO: Add error checking logic here to verify poll_option_id is valid
      @vote.save
    end
  end
end
