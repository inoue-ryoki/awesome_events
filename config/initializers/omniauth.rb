Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "c3057c5ebe7229f5140c", "6002b7c206468dbc5535499ef8e224a9ed527e47"
  else
    provider :github,
    Rails.application.credentials.github[:client_id],
    Rails.application.credentials.github[:client_secret]
  end
end
