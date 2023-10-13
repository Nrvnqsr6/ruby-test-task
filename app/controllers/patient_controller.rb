class PatientController < ApplicationController
    protect_from_forgery with: :null_session
    def find_all_recommendations
        @requests = ConsultationRequest.where(:patient_id => params[:patient_id])
        @recomendation = Recomendation.where(:consultation_request => @requests.select(:id))
        render json: JSON.pretty_generate(@recomendation.to_json)
    end
end
