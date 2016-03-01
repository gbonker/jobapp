class Post < ActiveRecord::Base

	#Relationships
	belongs_to :user

	#Validations
	validates_presence_of :title, :description

	#Scopes
	scope :chronological, -> { order(created_at: :asc) }
	scope :reverse_chronological, -> { order(created_at: :desc) }

end
