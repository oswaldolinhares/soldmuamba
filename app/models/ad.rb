class Ad < ActiveRecord::Base

  belongs_to :user
  belongs_to :vehicle
  belongs_to :building

  accepts_nested_attributes_for :vehicle
  accepts_nested_attributes_for :building

  mount_uploader :photo, PhotoUploader

  validates :title, presence: true
  validates :price, presence: true
  validates :photo, presence: true

  def self.create_building_form_partial(params = {}, user)
    Building.create(building_type: params[:building_attributes][:building_type],
                    area: params[:building_attributes][:area],
                    address: params[:building_attributes][:address],
                    rooms_number: params[:building_attributes][:rooms_number],
                    parking_number: params[:building_attributes][:parking_number],
                    description: params[:building_attributes][:description],
                    user_id: user.id)
  end

  def self.create_vehicle_form_partial(params = {}, user)
    Vehicle.create(name: params[:vehicle_attributes][:name],
                   brand: params[:vehicle_attributes][:brand],
                   year: params[:vehicle_attributes][:year],
                   km: params[:vehicle_attributes][:km],
                   description: params[:vehicle_attributes][:description],
                   description_vehicle: params[:vehicle_attributes][:description_vehicle],
                   user_id: user.id)
  end
end
