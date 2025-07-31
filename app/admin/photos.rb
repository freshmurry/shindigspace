# app/admin/photos.rb
ActiveAdmin.register Photo do
  permit_params :image, :venue_id, :_destroy

  index do
    selectable_column
    id_column
    column :venue
    column :image do |photo|
      image_tag photo.image.url(:thumb) if photo.image.present?
    end
    actions
  end

  form do |f|
    f.inputs 'Photo Details' do
      f.input :venue
      f.input :image, as: :file
    end
    f.actions
  end
end
