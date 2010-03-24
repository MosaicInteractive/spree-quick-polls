class Admin::PollResultsController < Admin::BaseController
  def index
    @votes = Vote.all
    @free_form_votes = FreeFormVote.all 
  end

  def show
    # TODO: Figure out how to optimize this
    @results = {}
    @poll = Poll.find(params[:id])
    test = Vote.all.select { |v| v.poll_option.poll_id = params[:id] }.collect { |upo| upo.user_id }.uniq
    test.each do |user_id|
      user_vote = User.find(user_id).get_user_vote(@poll.id)
      @results[user_vote.value] ||= 0
      @results[user_vote.value] += 1
    end

    @chart_url = 'http://chart.apis.google.com/chart?cht=p&chs=500x250&chd=t:' + @results.values.join(',') + '&chl=' + @results.keys.join('|')
  end
end
