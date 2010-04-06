class Admin::PollOptionsController < Admin::BaseController
  helper 'spree/base'
  resource_controller
  before_filter :set_poll
 
  def set_poll 
    @poll = Poll.find(params[:poll_id])
  end

  update.response do |format|
    format.html { redirect_to admin_polls_path }
  end
  create.response do |format|
    format.html { redirect_to admin_polls_path }
  end
  destroy.response do |format|
    format.html { redirect_to admin_polls_path }
  end
end
