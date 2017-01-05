class Page < ApplicationRecord
	extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
  	[
  		:title,
  		[:title, :id]
  	]
  end
end
