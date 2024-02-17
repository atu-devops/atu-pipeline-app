ActiveAdmin.register Attraction do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :park_id, :availability, :age_limit, :height_limit
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :park_id, :availability, :age_limit, :height_limit]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
