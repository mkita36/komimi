json.extract! reply, :id, :user_id, :tweet_id, :comment, :created_at, :updated_at
json.url reply_url(reply, format: :json)
