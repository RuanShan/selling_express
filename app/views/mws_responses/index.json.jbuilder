json.array!(@aws_responses) do |aws_response|
  json.extract! aws_response, :id, :amazon_request_id, :next_token, :request_type, :page_num, :last_updated_before, :created_before
  json.url aws_response_url(aws_response, format: :json)
end
