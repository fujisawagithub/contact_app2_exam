class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if params[:back]
       render :new
    else
    if @contact.save
       redirect_to contacts_path, notice: "作成しました！"      
    else
      render :new
    end
  end
end

  def edit
  end

  def update
      if @contact.update(contact_params)
        redirect_to contacts_path, notice: "編集しました"
      else
        render :edit
      end
    end

  def show
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path , notice: "削除しました"
  end
  
  private
  def contact_params
    params.require(:contact).permit(:title , :content)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
