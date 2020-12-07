import vehiculo.*
class Usuario {
	var property nombre
	var property dni
	var property dineroEnCuenta
	var property vehiculo
	var property infracciones
	
	method velocidadCirculacion(){
		return vehiculo.velocidadPromedio()
	}
	method dineroEnMultasSinPagar(){
		return infracciones.sum({multa=>multa.costo()})
	}
	method esUsuarioComplicado(){
		return self.dineroEnMultasSinPagar()>5000
	}
	method tengoVehiculoEcologico(){
		return vehiculo.esEcologico()
	}
	method pagar(unaCantidad){
		if (dineroEnCuenta>=unaCantidad){
			dineroEnCuenta-=unaCantidad
		}
		else{
			throw new NoHayDineroSufciente(message="no hay dinero suficinete")
		}
	}
	method recargarNafta(unaCantidad){
		self.pagar(vehiculo.cargaDenafta(unaCantidad))
	}
	 method hacerUnaDistncia(unaDistancia){
	 	vehiculo.recorrerDistancia(unaDistancia)
	 }
	 method pagarTodasLasMultas(){
	 	infracciones.forEach({multa=>self.pagarMulta(multa)})
	 }
	 
	method pagarMulta(multa){
		try{
		self.pagar(multa.costo())
		infracciones.remove(multa)
		
		}catch e:NoHayDineroSufciente{
			multa.sumarDiezPorciento()
		}
	}
	method agregarMulta(multa){
		infracciones.add(multa)
	}
}
class NoHayDineroSufciente inherits Exception{}
class Multa{
	var property costo
	var property estado
	
	method sumarDiezPorciento(){
		costo+=costo*0.1
	}		

}