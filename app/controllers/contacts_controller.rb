class ContactsController < ApplicationController
  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    Contact.create(contact_params)
    redirect_to new_contact_path
  end
  
  praivate
  def contact_params
    params.require(:contact).permit(:title , :content)
    redirect_to new_contac
  end

end
