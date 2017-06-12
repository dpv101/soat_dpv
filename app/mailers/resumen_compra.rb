class ResumenCompra < ApplicationMailer
  def resumen_compra(email, soat, cliente, vehiculo)
    @soat = soat
    @cliente = cliente
    @vehiculo = vehiculo
    @url  = 'http://www.gmail.com'
    mail(to: email, subject: "Resumen de compra SoatDpv")
  end
end
