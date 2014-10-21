class ContactoController < ApplicationController
  skip_before_action :authorize
  
  def index
  end

  def sender
    @datos = contacto_params

    puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<"
    puts params.inspect
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>"

    nombre = params["nombre"]
    email = params["email"]
    ciudad = params["ciudad"]
    pais = params["pais"]
    area_web = params["area_web"]
    area_realidad = params["area_realidad"]
    area_modulos = params["area_modulos"]
    area_video = params["area_video"]
    mensajes = params["mensajes"]


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
        to 'sebastian@tbf.mx' #'david@tbf.mx'#mail del webmaster
        from 'Servicios del Server <servidor@tbf.mx>'
        subject 'Contacto pagina Toner'
        text_part do
          body 'Hello world in text'
        end
        html_part do
          content_type 'text/html; charset=UTF-8'
          body '<h1>Mailer#send</h1>
          <p>Los siguintes datos fueron proporcionados por medio de la forma de contacto</p>
            <p>
              ' +  nombre  + '
            </p>
            <p>
              ' +  email  + '
            </p>
            <p>
              ' +  ciudad  + '
            </p>
            <p>
              ' +  pais  + '
            </p>
            <p> areas de interes:   </p>
          <p>
            ' + mensajes + '
          </p>'
        end
      end
  	#@datos = contacto_params
    #if 	Mailer.sended(@datos).deliver 
    #    redirect_to contacto_url, notice: 'Mensaje enviado exitosamente!'
    #  else
    #    redirect_to :action => "fail"
    #end      
    #puts  @datos 	
  end

  def fail
    puts "fallo";
  end

  def success
  end

  private
    def contacto_params
      params.permit(:nombre, :email, :ciudad, :pais, :area_web, :area_realidad, :area_modulos, :area_video, :mensajes)
    end

end
