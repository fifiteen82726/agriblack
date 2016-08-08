class Post < ActiveRecord::Base
	belongs_to :user
	has_many :userfruits
	accepts_nested_attributes_for :userfruits
	has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
