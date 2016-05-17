json.array!(@mws_requests) do |mws_request|
  json.extract! mws_request, :id, :amazon_request_id, :request_type
  json.url mws_request_url(mws_request, format: :json)
end
