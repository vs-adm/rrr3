=begin rdoc
  Home (welcome) controller for welcome base pages
=end
class HomeController < ApplicationController
  
=begin rdoc
  Entry point of entire app
=end
  def index
    @regions = Region.all
    @equipments = Equipment.all    
    @tariffs=[1,2,3]
  end
  
  def request_tariff
    begin
      tariff = Tariff.find(:first, :conditions => {
        :region_id => params[:region],
        :equipment_id => params[:equipment],
        :type => "Tariff"+params[:tariff]})
      render :json => {
        :tariff => params[:tariff],
        :t1 => tariff.t1,
        :t2 => tariff.t2,
        :t3 => tariff.t3 }
      rescue
        render :json => { :error => "error" }
    end
  end

end
