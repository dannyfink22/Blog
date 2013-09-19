class TagsController < ApplicationController

	before_filter :require_login, only: [:destroy]

	def tag_params
		params.require(:tag).permit(:name, :image_url)
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def index
		@tag = Tag.all
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to tags_path
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])
		@tag.update(tag_params)
		redirect_to tag_path(@tag)
	end



end
