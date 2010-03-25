class Admin::PollResultsController < Admin::BaseController
  def index
    @votes = Vote.all
  end

  def show
    @results = {}
    @poll = Poll.find(params[:id])
    # TODO: Figure out how to optimize this
    uniq_users = @poll.poll_options.collect { |po| po.votes }.flatten.collect { |v| v.user_id }.uniq
    @poll.poll_options.each { |po| @results[po.value] ||= 0 }
    uniq_users.each do |user_id|
      user_vote = User.find(user_id).get_user_vote(@poll.id)
      @results[user_vote.poll_option.value] += 1
    end

    mod_results = @results.clone.delete_if { |k, v| v == 0 }
    @chart_url = 'http://chart.apis.google.com/chart?cht=p&chs=500x250&chd=t:' + mod_results.values.join(',') + '&chl=' + mod_results.keys.join('|')
  end
end
