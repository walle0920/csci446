module FosterPlace
  extend ActiveSupport::Concern

  private

  def set_place
    @place = Fostered.find(session[:fostered_id])
  rescue ActiveRecord::RecordNotFound
    @place = Fostered.create
    session[:fostered_id] = @place.id
  end
end