class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  # Filtro para usuários deslogados usarem somente a action "show"
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  # Filtro para o usuário editar somente os anúncios dele
  before_action :edit_only_user_ads, only: [:edit, :destroy]

  respond_to :html

  def index
    # Somente os anúncios do usuário logado
    @ads = Ad.where(user: current_user)
    respond_with(@ads)
  end

  def show
    respond_with(@ad)
  end

  def new
    @ad = Ad.new
    # Cria um veículo com a relação para o anúncio se possuir o paramêtro vehicle_attributes
    # @ad.build_vehicle # if params[:vehicle_attributes].present?
    # Tem que se fazer o mesmo para imóvel
    @ad.build_building
    respond_with(@ad)
  end

  def edit
  end

  def create
    @ad = Ad.new(ad_params)
    if @ad.save
      price = params[:ad][:price].gsub('.', '').gsub(',', '.').to_f
      @ad.update(price: price)
      # Cria Veículo
      if params[:vehicle_attributes]
        @vehicle = Ad.create_vehicle_form_partial(params, current_user)
        @ad.update(vehicle: @vehicle)
      end
      # Cria imóvel
      if params[:building_attributes]
        @building = Ad.create_building_form_partial(params, current_user)
        @ad.update(building: @building)
      end
     
      flash[:notice] = 'Anúncio criado com sucesso.'
      redirect_to action: :index
    else
      flash[:alert] = @ad.errors.full_messages.first if @ad.errors.any?
      render action: :new
    end
  end

  def update
    price = params[:ad][:price].gsub('.', '').gsub(',', '.').to_f
    @ad.update(ad_params)
    @ad.update(price: price)
        # Edito o veículo
        if @ad.vehicle
          @ad.vehicle.update(description: params[:vehicle][:description],
                             name: params[:vehicle][:name],
                             brand: params[:vehicle][:brand],
                             year: params[:vehicle][:year],
                             km: params[:vehicle][:km],
                             description_vehicle: params[:vehicle][:description_vehicle])
        end
        # Edito o imóvel
        if @ad.building
          @ad.building.update(building_type: params[:building][:building_type],
                              area: params[:building][:area],
                              address: params[:building][:address],
                              rooms_number: params[:building][:rooms_number],
                              parking_number: params[:building][:parking_number],
                              description: params[:building][:description])
        end
      flash[:notice] = "Anúncio editado com sucesso."
      redirect_to action: :index
  end

  def destroy
    @ad.destroy
    flash[:notice] = "Anúncio removido com sucesso."
    redirect_to action: :index
  end

  private
    def set_ad
      @ad = Ad.find(params[:id])
    end

    def ad_params
      params.require(:ad).permit(:title, :price, :user_id, :photo,
                                 vehicle_attributes: [:id, :description, :name, :brand, :year, :km, :description_vehicle],
                                 building_attributes: [:id, :building_type, :area, :rooms_number, :parking_number, :description])
    end

    def edit_only_user_ads
      # Nessa linha ele vai montar um array de ids dos anúncios pertencentes ao usuário atual logado
      ads_id_collection = Ad.where(user: current_user).select(:id).map(&:id)
      # Converte em inteiro
      ad_id = params[:id].to_i
        unless ads_id_collection.include?(ad_id)
          redirect_to :back, alert: "Você não pode alterar esse anúncio"
        end
    end

end
