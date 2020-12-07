import usuario.*
class Zona {
	var property maximaVelocidadPermitido
	var property usuarios
	var property controles
	
	method activarControles(){
		controles.forEach({control=>self.controlUsuario(control)})
	}
	method controlUsuario(control){
		usuarios.forEach({usuario=>control.infracciones(usuario,self)})
	}
}
class Controles{
	method generarMulta(cantidad){
		return new Multa(costo=cantidad,
						estado=false
		)
	}
}
class DeVelocidad inherits Controles{
	method infracciones(usuario,zona){
		if(zona.maximaVelocidadPermitido()<usuario.velocidadCirculacion()){
			usuario.agregarMulta(self.generarMulta(3000))
		}
	}
	
}
class Ecologico inherits Controles{
	method infracciones(usuario,zona){
		if(usuario.tengoVehiculoEcologico()){
			usuario.agregarMulta(self.generarMulta(1500))
		}
	}
	
}
class Regulatorios inherits Controles{
	const dia= new Date().day()
	method infracciones(usuario,zona){
		if((dia.even() && !usuario.dni().even())||(!dia.even() && usuario.dni().even())){
			usuario.agregarMulta(self.generarMulta(2000))
		}
	}
	
}