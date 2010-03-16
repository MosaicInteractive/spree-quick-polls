# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class QuickPollsExtension < Spree::Extension
  version "1.0"
  description "Quick Poll Functionality for Spree"
  url "http://www.spinlocksolutions.com/"

  def activate
    Role.class_eval do
      has_and_belongs_to_many :quick_polls
    end

    Admin::ConfigurationsController.class_eval do
      before_filter :add_quick_poll_link, :only => :index
      def add_quick_poll_link
        @extension_links << {
          :link => admin_polls_path,
          :link_text => t('ext_quick_poll_manage'),
          :link_text => t('ext_quick_poll_desc')
        }
      end
    end
  end
end
