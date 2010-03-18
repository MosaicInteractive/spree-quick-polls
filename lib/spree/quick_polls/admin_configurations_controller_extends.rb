module Spree::QuickPolls::AdminConfigurationsControllerExtends
  def self.included(controller)
    controller.prepend_before_filter :add_quick_poll_link, :only => :index
  end
  def add_quick_poll_link
    @extension_links << {
      :link => admin_polls_path,
      :link_text => t('ext_quick_poll_manage'),
      :link_text => t('ext_quick_poll_desc')
    }
  end
end

