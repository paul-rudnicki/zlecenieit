class Advertisment < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :geolocation

  has_many :offers

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
  	[
  		:title,
  		[:title, :id]
  	]
  end

  before_create :set_ended_date

  validates :title, presence: { message: 'nie może być pusty' }
  validates :content, :presence => { :message => 'nie może być pusta' }
  validates :category_id, presence: { message: 'musi być ustawiona'}
  validates :geolocation_id, :presence => { message: 'musi być ustawiona'}
  validates :price, :presence => { message: 'musi być ustawiony'}
  validates :realization, :presence => { message: 'musi być ustawiona'}, :on => :create

  scope :active, -> { where(status: true, closed: false).order(created_at: :desc) }

  def set_ended_date
    self.ended_date = Time.now + realization.to_i.days
  end


end
