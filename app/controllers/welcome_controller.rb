class WelcomeController < ApplicationController
  skip_before_action :authorize , only: [:create, :destroy, :test_trial, :index, :new] 
  def index
  end

  def new
  end

  def create
  	user = User.find_by(username: params[:username])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		session[:uname] = user.name + " " + user.lastname
  		session[:rol_id] = user.rol_id
      puts "dentro del if"
      puts "hola" + user.name + " " + user.lastname

      #variables de rol
      rol =Rol.find_by(id: user.rol_id)
      session[:mod0] =rol.admin
      session[:mod1] =rol.module_1
      session[:mod2] =rol.module_2
      session[:mod3] =rol.module_3
      session[:mod4] =rol.module_4
      session[:mod5] =rol.module_5
      #termina variables de rol


      unless session[:lasurl].nil? || session[:lasurl].empty?
  		  redirect_to session[:lasurl]
      else 
        redirect_to root_url
      end

  	else
  		redirect_to root_url, alert: "Invalid user/password combination"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, notice: "Logged out"
  end

  def test_trial
    
  end
  def pagos
    
      
  end

  def pago_correcto
    require 'mail'
      Mail.defaults do
        delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                                 :port      => 587,
                                 :domain    => "tbf.mx",
                                 :user_name => "davidzu",
                                 :password => "Mictlan9",
                                 :authentication => :login,
                                 :enable_starttls_auto => true }
      end

      mail = Mail.deliver do
        to 'david@tbf.mx' #'sebastian@tbf.mx' #mail del webmaster
        from 'Servicios del Server <servidor@tbf.mx>'
        subject 'pagos a TBF'
        text_part do
          body 'el pago se realizo con exito por el usuario' + session[:uname]
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body 'el pago se realizo con exito por el usuario' + session[:uname]
        end
      end
      redirect_to root_path 
  end  

  def pago_cancelado
    require 'mail'
      Mail.defaults do
        delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                                 :port      => 587,
                                 :domain    => "tbf.mx",
                                 :user_name => "davidzu",
                                 :password => "Mictlan9",
                                 :authentication => :login,
                                 :enable_starttls_auto => true }
      end

      mail = Mail.deliver do
        to 'david@tbf.mx' #'sebastian@tbf.mx' #mail del webmaster
        from 'Servicios del Server <servidor@tbf.mx>'
        subject 'pagos a TBF'
        text_part do
          body 'el pago se cancelo por el usuario' + session[:uname]
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body 'el pago se cancelo por el usuario' + session[:uname]
        end
      end
      redirect_to root_path
  end  


end
