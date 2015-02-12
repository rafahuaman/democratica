class RankScoresController < ApplicationController

  # def create
  #   rankable_class = params[:rank_score][:rankable_type].constantize
  #   @rankable = rankable_class.find(params[:rank_score][:rankable_id])
  #   current_user.rank_score!(@rankable, params[:rank_score][:value])
  #   respond_to do |format|
  #     format.html { redirect_to @rankable }
  #     format.js
  #   end
  # end

  # def destroy
  #   @rankable = RankScore.find(params[:id]).rankable
  #   current_user.unrank_score!(@rankable)
  #   respond_to do |format|
  #     format.html { redirect_to @rankable }
  #     format.js
  #   end
  # end
end