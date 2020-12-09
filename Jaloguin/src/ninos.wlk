class Ninos {
	var property actitud
	var property elementoPuestos
	var property cantidadDeCaramelos
	var property estado
	
	method capacidadDeSusto(){
		return self.sustoQueGeneranLosElementosPuestos() * actitud
	}
	method disminuirActitud(cantidadADisminuir){
		actitud-=cantidadADisminuir
	}
	method sustoQueGeneranLosElementosPuestos(){
		return elementoPuestos.sum({elemento=>elemento.sustoQueGenera()})
	}
	method asustarAdulto(adulto){
		if(self.estado().estaBien()){
		self.sumarCaramelos(adulto.loTratanDeAsustar(self))
		}
		else{
			throw new ExceptionNoPuedeAsustarMas(message="no puede asustar")
		}
	}
	method sumarCaramelos(unaCantidad){
		cantidadDeCaramelos+=unaCantidad
	}
	method darCaramelosAlLider(adulto){
		return adulto.loTratanDeAsustar(self)
	}
	method puedeComerCaramelos(unaCantidad){
		return unaCantidad<cantidadDeCaramelos && self.estado().estaBien()
	}
	
	method comerCaramelos(unaCantidad){
		if(self.puedeComerCaramelos(unaCantidad)){
			cantidadDeCaramelos-=unaCantidad
		}
		else{
			throw new ExceptionNoPuedeComerCaramelos(message="no puede comer mas caramelos")
		}
	}
}

object saludable{
	method estadoDeSalud(unaCantidad,nino){
		if(unaCantidad>10){
			nino.estado(empachado)
			nino.disminuirActitud((nino.actitud()/2))
		}
	}
	method estaBien(){
		return true
	}
}

object empachado{
	method estadoDeSalud(unaCantidad,nino){
		if(unaCantidad>10){
			nino.estado(enCama)
		}
	}
	method estaBien(){
		return true
	}
}

object enCama{
	method estadoDeSalud(unaCantidad,nino){
	
	}
	method estaBien(){
		return false
	}
}

class Maquillaje {
	method sustoQueGenera(){
		return 3
	}
}
class Traje {
	method sustoQueGenera()
}

class Tienernos inherits Traje{
	override method sustoQueGenera(){
		return 2
	}
}
class Terrorifico inherits Traje{
	override method sustoQueGenera(){
		return 5
	}
}

 class ExceptionNoPuedeComerCaramelos inherits Exception {}
 class ExceptionNoPuedeAsustarMas inherits Exception {}