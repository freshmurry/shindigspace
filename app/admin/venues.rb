ActiveAdmin.register Venue do
  permit_params :listing_name, :accommodate, :description, :address, :is_tables, :is_chairs, :is_projector, :is_wifi, :is_speakers, :price, :active, :longitude, :latitude, :user_id, :bathrooms, :parking, photos_attributes: [:id, :image, :_destroy]

  controller do
    before_action :set_user, only: [:create, :update]

    def set_user
      params[:venue][:user_id] ||= current_admin_user.id if params[:venue].present?
    end

    def create
      @venue = Venue.new(permitted_params[:venue])

      if @venue.save
        redirect_to admin_venue_path(@venue), notice: "Venue created successfully."
      else
        render :new
      end
    end

    def update
      @venue = Venue.find(params[:id])
      if @venue.update(permitted_params[:venue])
        redirect_to admin_venue_path(@venue), notice: "Venue updated successfully."
      else
        render :edit
      end
    end
  end

  index do
    selectable_column
    id_column
    column :listing_name
    column :accommodate
    column :description
    column :address
    column :price
    column :active
    column :user
    column :photos do |venue|
      venue.photos.map { |photo| image_tag(photo.image.url(:thumb)) }.join(' ').html_safe
    end
    actions
  end

  form do |f|
    f.inputs 'Venue Details' do
      f.input :listing_name
      f.input :address
      f.input :description
      f.input :price
      f.input :accommodate, as: :select, collection: [["10", 10], ["20", 20], ["30", 30], ["30", 30], ["40", 40], ["50", 50], ["60", 60], ["70", 70], ["80", 80], ["90", 90], ["100", 100], 
      ["120", 120], ["130", 130], ["150", 150], ["200", 200], ["250", 250], ["300+", 300]], prompt: "Select..."
      f.input :latitude
      f.input :longitude
      f.input :bathrooms, as: :select, collection: [["1", 1], ["2", 2], ["3", 3], ["4", 4]], prompt: "Select..."
      f.input :parking, as: :select, collection: [["Parking Lot", "Parking Lot"], ["Street Parking", "Street Parking"], ["Parking Garage", "Parking Garage"], ["Valet Parking", "Valet Parking"]], prompt: "Select..."
    end

    f.inputs "Amenities" do
      f.input :is_tables
      f.input :is_chairs
      f.input :is_projector
      f.input :is_wifi
      f.input :is_speakers
    end

    f.inputs 'Photos' do
      f.input :new_photos, as: :file, input_html: { multiple: true }
      # f.has_many :photos, allow_destroy: true, new_record: true do |pf|
      #   pf.input :image, as: :file
      #   pf.input :_destroy, as: :boolean, label: 'Remove'
      # end
    end

    f.inputs 'Existing Photos' do
      f.object.photos.each do |photo|
        f.input :photos, as: :file, hint: photo.image.present? ? image_tag(photo.image.url(:thumb)) : "No Photos Yet"
        f.input :_destroy, as: :boolean, label: 'Delete' if f.object.persisted?
      end
    end

    f.inputs 'Active' do
      f.input :active, as: :select, collection: [['Active', true], ['Inactive', false]], include_blank: false
    end

    f.inputs 'User' do
      f.input :user, as: :select, collection: User.all.collect { |u| [u.email, u.id] }, prompt: 'Select a User'
    end

    f.actions
  end

  show do
    attributes_table do
      row :listing_name
      row :accommodate
      row :description
      row :address
      row :price
      row :active
      row :user
      row :longitude
      row :latitude
      row :bathrooms
      row :parking
      row :created_at
      row :updated_at
    end

    panel "Images" do
      table_for resource.photos do
        column :image do |photo|
          image_tag photo.image.url(:thumb) if photo.image.present?
        end
        column "Actions" do |photo|
          link_to "Delete", admin_photo_path(photo), method: :delete, data: { confirm: "Are you sure?" }
        end
      end
    end

    active_admin_comments
  end
end
