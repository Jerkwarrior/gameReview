# Frozen_string_literal: true

class CompaniesController < ApplicationController # :nodoc:
  before_action :set_company, only: [:show]

  def index
    @companies = Company.all
  end

  def show; end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :slug, :logo_url, :description,
                                    :country, :website)
  end
end
