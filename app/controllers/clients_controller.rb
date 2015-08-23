class ClientsController < ApplicationController
  layout 'ajoke'
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!
  before_action :admin_check

  def index
    @client = Client.new
    @Cl = Client.all
    @Client = @Cl.order(name: :asc)
    @Clients = @Client.paginate(:page => params[:page],:per_page => 10)
    @title = "All Clients"

  end

  def create
    name = params[:name]
    email = params[:email]
    @client = Client.new(name: name, email: email)
    if @client.save
      redirect_to ajoke_clients_edit_path(client: @client.id)
    else
      render 'index'
    end

  end

  def edit
    @client = Client.find_by(id: params[:client])
    @cities = ['Andhra Pradesh','Arunachal Pradesh','Assam','Bihar','Chhattisgarh','Goa','Gujarat','Haryana',
                'Himachal Pradesh','Jammu & Kashmir','Jharkhand','Karnataka','Kerala','Madhya Pradesh','Maharashtra','Manipur',
                'Meghalaya','Mizoram','Nagaland','Odisha (Orissa)','Pondicherry (Puducherry)','Punjab','Rajasthan','Sikkim','Tamil Nadu','Telangana ',
                'Tripura','Uttar Pradesh','Uttarakhand','West Bengal','Andaman and Nicobar Islands','Chandigarh','Dadra and Nagar Haveli',
                'Daman and Diu','Lakshadweep','Delhi'
              ]
    @galleries = Gallery.where("id != 1")
    @gals = []
    gals = ClientGallery.where(client_id: @client.id)
    unless gals.nil?
      gals.each do |g|
        @gals.push(g.gallery_id)
      end
    end
  end

  def update
    @client = Client.find(params[:client][:id])
    galleries = params[:client][:galleries].split(",")
    ClientGallery.where(client_id: @client.id).destroy_all

    if @client.update_attributes(params[:client].permit(:name, :email, :phone_no, :city))
      galleries.each do |g|
        ClientGallery.create(gallery_id: g, client_id: @client.id)
      end
      flash[:notice] = "Client details updated!"
      redirect_to ajoke_clients_path
    else
      render 'edit'
    end
  end

  def update_client
    if params[:client][:id].nil?
      ClientGallery.create(gallery_id: g, client_id: params[:client][:gallery])
    else
      @client = ClientGallery.find(params[:client][:id])
      @client.client_id = params[:client][:name]
      @client.save
    end
    #flash[:notice] = "Client details updated!"
    render :json => 'success'
  end

  def delete
  end
end
