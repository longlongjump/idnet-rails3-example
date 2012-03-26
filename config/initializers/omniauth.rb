

APP_CONFIG = YAML.load_file(File.join(Rails.root, "config", "settings.yml")).symbolize_keys!

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :idnet, APP_CONFIG[:app_id], APP_CONFIG[:app_secret],
           :fields => OmniAuth::Idnet::DEFAULT,
           :client_options => {:site => APP_CONFIG[:site],
                               :authorize_url => APP_CONFIG[:authorize_url],
                               :access_token_url => APP_CONFIG[:access_token_url]}
end
