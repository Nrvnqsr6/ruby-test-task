class UserMailer < ApplicationMailer
    #default from: "notifications@example.com"

    def new_recommendation_email
        #debugger
        @patient = params[:patient]
        @consultation_request = params[:consultation_request]
        mail(to: @patient.email, subject: "Новая рекомендация") do |format|
            format.text
        end
    end

end
