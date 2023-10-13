Rails.application.routes.draw do

  post '/consultation_requests', to:"consultation_request#create"
  post '/consultation_requests/:request_id/recommendations', to:"recomendation#create"
  get '/patients/:patient_id/recommendations', to:"patient#find_all_recommendations"
end
