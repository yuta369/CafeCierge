class ContactsController < ApplicationController
  def new
    @contact = Contact.new(session[:contact_params] || {})
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      session[:contact_params] = contact_params
      render :confirm
    else
      flash.now[:alert] = "入力内容に誤りがあります。"
      render :new
    end
  end

  def complete
    @contact = Contact.new(session[:contact_params])
    if @contact.save
    else
      flash.now[:alert] = "送信に失敗しました。もう一度やり直してください。"
      render :new
    end
  end

  def complete_page
    render :complete
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
