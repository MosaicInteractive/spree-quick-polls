class QuickPollsExtension < Spree::Extension
  version "1.0"
  description "Quick Poll Functionality for Spree"
  url "http://www.spinlocksolutions.com/"

  def activate
    Role.class_eval do
      has_and_belongs_to_many :polls
    end
    User.class_eval do
      has_and_belongs_to_many :polls
    end

    Admin::ConfigurationsController.send(:include, Spree::QuickPolls::AdminConfigurationsControllerExtends)
    Spree::BaseController.send(:include, Spree::QuickPolls::BaseControllerExtends)
  end
end
