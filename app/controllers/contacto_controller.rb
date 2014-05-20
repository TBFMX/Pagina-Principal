class ContactoController < ApplicationController
  skip_before_action :authorize
  
  def index
  end

  def sender
  	@datos = contacto_params
    if 	Mailer.sended(@datos).deliver 
        redirect_to contacto_url, notice: 'Mensaje enviado exitosamente!'
      else
        redirect_to :action => "fail"
    end      
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
