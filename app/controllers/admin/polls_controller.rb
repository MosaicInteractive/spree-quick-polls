class Admin::PollsController < Admin::BaseController
  helper 'spree/base'
  resource_controller

  before_filter :set_roles, :only => :update
  after_filter :free_form_adjust, :only => [:create, :update] #create.after :free_form_adjust
  before_filter :set_free_form, :only => [ :edit ]

  def set_free_form
    @free_form = object.poll_options.select { |po| po.value == 'free_form' }.empty? ? false : true
  end 
   
  def set_roles
    object.roles = [] unless params[:poll].key? :role_ids
  end

  def free_form_adjust
    params[:poll_free_form] ? PollOption.create({ :value => "free_form", :poll_id => object.id }) : PollOption.delete(object.poll_options.select { |po| po.value == 'free_form' })
  end

  update.response do |format|
    format.html { redirect_to admin_polls_path }
  end
  create.response do |format|
    format.html { redirect_to edit_admin_poll_path(@poll) }
  end
end
