ActiveAdmin.register TicketType do

  permit_params :description, :type_name, :park_id, :price

  index do
    selectable_column
    id_column
    column :description
    column :type_name
    column :park
    column :price
    actions
  end

  filter :description
  filter :type_name
  filter :park
  filter :price

  form do |f|
    f.inputs do
      f.input :description
      f.input :type_name
      f.input :park
      f.input :price
    end
    f.actions
  end

  show do
    attributes_table do
      row :description
      row :type_name
      row :park
      row :price
    end
  end

  controller do
    def create
      @ticket_type = TicketType.new(permitted_params[:ticket_type])
      if @ticket_type.save
        redirect_to admin_ticket_type_path(@ticket_type)
      else
        render :new
      end
    end

    def update
      @ticket_type = TicketType.find(params[:id])
      if @ticket_type.update(permitted_params[:ticket_type])
        redirect_to admin_ticket_type_path(@ticket_type)
      else
        render :edit
      end
    end
  end
end
