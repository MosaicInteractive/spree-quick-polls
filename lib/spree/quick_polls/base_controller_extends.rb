module Spree::QuickPolls::BaseControllerExtends
  def self.included(controller)
    controller.append_before_filter :define_poll
  end

  def define_poll
    # TODO: Change to sort_by created_date later
    @poll = current_user.roles.collect { |r| r.polls }.flatten.sort_by { |p| p.id }.first if current_user && current_user.roles
  end
end
