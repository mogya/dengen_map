ActiveAdmin.setup do |config|
  config.site_title = "Dengenmap"
  # config.site_title_link = "/"
  # config.site_title_image = "logo.png"
  config.default_namespace = :aa

  config.root_to = 'dashboard#index'
  config.current_user_method = :current_user
  config.authentication_method = :authenticate_user!
  config.authorization_adapter = "ActiveAdmin::OnlyAdminAuthorization"
  config.before_filter :set_admin_timezone
  config.on_unauthorized_access = :access_denied
  config.logout_link_path = :destroy_user_session_path
  config.logout_link_method = :delete
  config.batch_actions = true
  config.localize_format = :long
end
module ActiveAdmin::ViewHelpers
  include ApplicationHelper
end
