class Admin::PollsController < Admin::BaseController
  helper 'spree/base'
  resource_controller
  before_filter :set_roles, :only => [ :create, :update ]

  def set_roles
    @poll.role_ids = nil unless params[:poll].key? :role_ids
  end

  update.response do |format|
    format.html { redirect_to admin_polls_path }
  end
  create.response do |format|
    format.html { redirect_to edit_admin_poll_path(@poll) }
  end
end
