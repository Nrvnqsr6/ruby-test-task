class RecomendationController < ApplicationController
    protect_from_forgery with: :null_session
    def create
        @recomendation = Recomendation.create(
            consultation_request_id: params[:request_id],
            recomendation_text: params[:recommendation_text],
            #created_at: DateTime.now
        )
        render json: JSON.pretty_generate(@recomendation.to_json)
    end
end
