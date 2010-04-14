module Spree::QuickPolls::BaseControllerExtends
  def self.included(controller)
    controller.append_before_filter :record_vote, :define_poll
  end

  def define_poll
    @vote = Vote.new
    @poll = get_current_poll
    @current_user_vote = current_user.get_user_vote(@poll.id) if current_user && @poll
  end

  def get_current_poll
    return if current_user.nil?
    Poll.find(:all, :order => "created_at DESC").select { |p| !(p.roles & current_user.roles).empty? }.first
  end

  def record_vote
    if params[:vote]
      @vote = Vote.new({ :poll_option_id => params[:vote][:poll_option_id], :user_id => current_user.id, :ip_address => request.remote_ip, :voted_at => Time.now })
      if @vote.save
        if @vote.poll_option.value == 'free_form'
          FreeFormVote.create({ :vote_id => @vote.id, :value => params[:free_form_value] })
        end
      else
        # TODO Add logging for failed vote
      end
    end
  end
end
