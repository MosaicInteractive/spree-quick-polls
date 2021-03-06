class Admin::PollsController < Admin::BaseController
  helper 'spree/base'
  resource_controller

  before_filter :set_roles, :only => :update
  after_filter :free_form_adjust, :only => [:create, :update]

  def set_roles
    return if !params[:poll]
    object.roles = [] unless params[:poll].key? :role_ids
  end

  def free_form_adjust
    if params[:poll_free_form] && object.poll_options.select { |po| po.value == "free_form" }.empty?
      PollOption.create({ :value => "free_form", :poll_id => object.id })
    elsif !params[:poll_free_form]
      PollOption.delete(object.poll_options.select { |po| po.value == 'free_form' })
    end
  end

  update.response do |format|
    format.html { redirect_to admin_polls_path }
  end
  create.response do |format|
    format.html { redirect_to admin_polls_path }
  end

  destroy.success.wants.js { render_js_for_destroy }
end
