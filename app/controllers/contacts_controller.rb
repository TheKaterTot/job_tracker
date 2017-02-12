class ContactsController < ApplicationController
  before_action :set_company, only: [:create]

  def create
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      redirect_to company_path(@company)
    else
      render "companies/show"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :email)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
