class QuickPollsExtension < Spree::Extension
  version "1.0"
  description "Quick Poll Functionality for Spree"
  url "http://www.spinlocksolutions.com/"

  def activate
    Role.class_eval do
      has_and_belongs_to_many :polls
    end

    # TODO: Move this out of extensions file to module
    User.class_eval do
      has_many :votes

      def get_user_vote(poll_id)
        return if self.votes.empty?
        current_votes = self.votes.select { |v| v.poll_option && v.poll_option.poll_id == poll_id }
        return if current_votes.empty?
        current_votes.sort_by { |v| v.voted_at }.last
      end
    end

    Spree::BaseController.send(:include, Spree::QuickPolls::BaseControllerExtends)
  end
end
