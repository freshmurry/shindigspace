ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password, required: false
      f.input :password_confirmation, required: false
    end
    f.actions
  end

  class AdminUser < ApplicationRecord
    # ActiveAdmin already provides `devise` for AdminUser
    devise :database_authenticatable, :recoverable, :rememberable, :validatable
  
    # Override password validation
    validates :password, presence: false, allow_blank: true
  end

end
