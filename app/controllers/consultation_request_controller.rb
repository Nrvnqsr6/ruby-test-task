require 'date'

class ConsultationRequestController < ApplicationController
    protect_from_forgery with: :null_session
    def create
        #альтернативный вариант, более правильный, как я понял
        #consultation_request_params = params.require(:consultation_request).permit(:patient_id, :request_text)
        #@request = ConsultationRequest.create(consultation_request_params)
        @request = ConsultationRequest.create(
            patient_id: params[:patient_id],
            request_text: params[:request_text],
            created_at: DateTime.now
        )
        render json: JSON.pretty_generate(@request.to_json)
    end
end
