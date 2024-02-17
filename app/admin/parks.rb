ActiveAdmin.register Park do

  permit_params :park_name, :description, :capacity, :availability, :image

  index do
    selectable_column
    id_column
    column :park_name
    column :description
    column :capacity
    column :availability
    # column :image do |park|
    #   image_tag park.image.url(:thumb)
    # end
    actions
  end

  filter :park_name
  filter :description
  filter :capacity
  filter :availability

  form do |f|
    f.inputs do
      f.input :park_name
      f.input :description
      f.input :capacity
      f.input :availability
      # f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :park_name
      row :description
      row :capacity
      row :availability
      # row :image do |park|
      #   image_tag park.image.url(:thumb)
      # end
    end
  end

  controller do
    def create
      @park = Park.new(permitted_params[:park])
      if @park.save
        redirect_to admin_park_path(@park)
      else
        render :new
      end
    end

    def update
      @park = Park.find(params[:id])
      if @park.update(permitted_params[:park])
        redirect_to admin_park_path(@park)
      else
        render :edit
      end
    end
  end
  
end
