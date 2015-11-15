ActiveAdmin.register User do
  index do
    column :id
    column :name do |user|
      link_to user.name, aa_user_path(user)
    end
    column :email
    column :create_at
    column :updated_at
    column :admin
  end
  filter :name
  filter :email
  filter :remember_created_at
  filter :current_sign_in_at
  filter :last_sign_in_at
  filter :created_at
  filter :updated_at
  filter :admin
end
