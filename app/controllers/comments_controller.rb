class CommentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def create
		@recipe = Recipe.find(params[:recipe_id])
		if @recipe.comments.create(comment_params)
			redirect_to @recipe,
				notice: 'Success!'
		else
			redirect_to @recipe,
				alert: 'Error!'
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:name, :body)
	end
end
