class Article < ActiveRecord::Base
	validates :title, :presence => :true
	validates :body, :presence => :true

	has_many :comments

	has_many :taggings
	has_many :tags, through: :taggings
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }

	def tag_list
		tags.join(", ")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
		#tag = Tag.find_or_create_by(name: tag_name)
		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
		self.tags = new_or_found_tags
	end



end
