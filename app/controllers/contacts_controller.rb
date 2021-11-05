class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
    redirect_to contacts_path, notice: "作成しました！"      
    else
      render :new
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end
  
  private
  def contact_params
    params.require(:contact).permit(:title , :content)
  end

end
