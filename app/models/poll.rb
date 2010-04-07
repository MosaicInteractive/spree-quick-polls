class Poll < ActiveRecord::Base
  has_many :poll_options
  has_and_belongs_to_many :roles
  
  validates_uniqueness_of :name
  validates_presence_of :name

  def sorted_poll_options
    free_form = nil
    sorted = self.poll_options.inject([]) { |arr, po| po.value == 'free_form' ? (free_form = po) : (arr.push po); arr }.sort_by { |po| po.id }
    sorted << free_form if free_form
    sorted
  end

  def has_free_form?
    self.poll_options.any? { |po| po.value == 'free_form' }
  end
end
