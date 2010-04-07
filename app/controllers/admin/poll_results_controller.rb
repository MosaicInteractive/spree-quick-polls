class Admin::PollResultsController < Admin::BaseController
  def index
    @votes = Vote.all
  end

  def show
    #@results = {}
    @poll = Poll.find(params[:id])

    @results = @poll.poll_options.inject({}) { |hash, po| hash[po.value] = 0; hash }
    # TODO: Optimize this?
    @poll.poll_options.collect { |po| po.votes }.flatten.collect { |v| v.user }.uniq.each do |user|
      @results[user.get_user_vote(@poll.id).poll_option.value] += 1
    end

    mod_results = @results.clone.delete_if { |k, v| v == 0 }
    @chart_url = 'http://chart.apis.google.com/chart?cht=p&chs=500x250&chd=t:' + mod_results.values.join(',') + '&chl=' + mod_results.keys.join('|')
  end
end
