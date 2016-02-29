class Post < ActiveRecord::Base

	#Relationships
	belongs_to :user

	#Validations
	validates_presence_of :title, :description, :user_id

	#Scopes
	scope :chronological, -> { order(created_at: :desc) }
	scope :reverse_chronological, -> { order(created_at: :asc) }

end
