class Mailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.reset_password.subject
  #
  def reset_password(user,uemail)
    @greeting = "Hi"
    @user = user
    #mail to: uemail
    mail(:to => uemail, :subject => "Password Reset", :from => "\"System\"<info@tbf.mx>")

  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.recover_password.subject
  #
  def recover_password(user,uemail)
    @greeting = "Hi"
    @user = user
    #mail to: uemail
    mail(:to => uemail, :subject => "Recuperacion de Password", :from => "\"System\"<info@tbf.mx>", :reply_to =>"noreply@tbf.com")
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset" , :from => "\"System\"<info@tbf.mx>", :reply_to =>"noreply@tbf.com"
  end

  def create_user(user)
    @user = user
    enviar_a= user.email 
    mail :to => enviar_a, :cco => "sebastian@tbf.mx" ,:subject => "Se creo su usuario", :from => "\"System\"<info@tbf.mx>", :reply_to =>"david@tbf.com"
  end

  def destroy_user(user)
    @user = user
    mail :to => user.email, :subject => "Su usuario a sido destruido", :from => "\"System\"<info@tbf.mx>", :reply_to =>"noreply@tbf.com"
  end

  def sended(datos)
    @greeting = "Hi"
    @datos = datos

    mail(:to => "david@tbf.mx", :subject => "Nuevo Mensaje de Contacto", :from => "\"System\"<info@tbf.mx>", :reply_to =>"noreply@tbf.com")
    #mail to: "hugo@tbf.mx"
  end
  
end
