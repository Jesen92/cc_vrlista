class CompaniesController < ApplicationController
  def index
    @page_title = "Kompanija"
    @companies = Company.all

    @companies_grid = initialize_grid(@companies, order: 'companies.name', order_direction: 'desc', per_page: 15)
  end

  def show
    @company = Company.find(params[:id])
    @page_title = "Kompanija | " + @company.title
  end

  def new
    @company = Company.new
    @page_title = "Kompanija | New"
  end

  def create
    @company = Company.new(company_params)

    @company.save

    flash[:notice] = "Dodana je nova kompanija!"

    redirect_to companies_index_path
  end

  def edit
    @company = Company.find(params[:id])
    @page_title = "Edit | "+@company.title
  end

  def update
    @company = Company.find(params[:id])

    @company.update(company_params)

    flash[:notice] = "Kompanija je izmijenjena!"

    redirect_to companies_index_path
  end

  def destroy
    @company = Company.find(params[:id])

    @company.destroy

    flash[:notice] = "Kompanija je izbrisana!"

    redirect_to companies_index_path
  end

  protected
  def company_params
    params.require(:company).permit(:name, :country, :city, :address, :vat)
  end
end
