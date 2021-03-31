class CpvsController < ApplicationController
    
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR numstring ILIKE :query"
      @cpvs = Cpv.where(sql_query, query: "%#{params[:query]}%")
    else
      @cpvs = Cpv.order(:number)
    end
  end
end