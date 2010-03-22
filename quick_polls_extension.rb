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
      has_many :user_poll_options

      def get_user_vote(poll_id)
        return if self.user_poll_options.empty?
        current_votes = self.user_poll_options.select { |v| v.poll_option.poll_id == poll_id }
        return if current_votes.empty?
        current_votes.sort_by { |v| v.voted_at }.last.poll_option
      end
    end

    Admin::ConfigurationsController.send(:include, Spree::QuickPolls::AdminConfigurationsControllerExtends)
    Spree::BaseController.send(:include, Spree::QuickPolls::BaseControllerExtends)
  end
end
