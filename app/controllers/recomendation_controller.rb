class RecomendationController < ApplicationController
    protect_from_forgery with: :null_session
    after_action

    def create
        recomendation_json = JSON.parse(request.body.read())
        #debugger
        @recomendation = Recomendation.create(
            consultation_request_id: recomendation_json["consultation_request_id"],
            recomendation_text: recomendation_json["recommendation_text"],
        )
        send_email()
        render json: JSON.pretty_generate(@recomendation.to_json)
    end

    private def send_email
        #debugger
        if response.status == 200
            @consultation_request = ConsultationRequest.find(@recomendation.consultation_request_id)
            @patient = Patient.find(@consultation_request.patient_id)
            UserMailer.with(patient: @patient, consultation_request: @consultation_request).new_recommendation_email.deliver_now
        end
    end

end
