class ActiveAdmin::OnlyAdminAuthorization < ActiveAdmin::AuthorizationAdapter
  def authorized?(action, subject = nil)
    user.try(:admin?)
  end
end
