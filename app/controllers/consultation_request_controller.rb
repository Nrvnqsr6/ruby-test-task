require 'date'
require 'net/http'
require "uri"
require "json"
require "net/https"

require "httparty"

class ConsultationRequestController < ApplicationController
    protect_from_forgery with: :null_session
    include HTTParty
    def create
        request_json = JSON.parse(request.body.read())
        @request = ConsultationRequest.create(
            patient_id: request_json["patient_id"],
            request_text: request_json["request_text"],
            created_at: DateTime.now
        )
        make_analisys_request(@request)
        render json: JSON.pretty_generate(@request.to_json)
    end

    def make_analisys_request(request)
        if response.status == 200
            #имитация запроса к сервису и ответнего запроса от него для создания рекомендации на основе анализа данных
            #не особо понял смысл данной части задания, поэтому реализовал просто как произвольную работу с api
            @result = HTTParty.get("https://api.fda.gov/drug/drugsfda.json",
                :query => {:search => "products.dosage_form.exact:\"TABLET\"", :limit => "2"}
                #:body => request.to_json,
                #:headers => {"Content-Type" => "text/json"}
            )
            #условный ответный post-запрос#
            res = @result["results"]
            recommendation = {:consultation_request_id => request.id, :recommendation_text => res.to_json}
            @result = HTTParty.post("http://localhost:3000/consultation_requests/#{request.patient_id}/recommendations",
                :body => recommendation.to_json,
                :headers => {"Content-Type" => "text/json"})
            #debugger
        end
    end
end
