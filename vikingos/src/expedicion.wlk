import vikingo.*
class Expedicion {
	var property tripulacion
	var property objetivos

	method cantidadDeTripulantes(){
		return tripulacion.size()
	}
	method invadir(){
		objetivos.forEach({objetivo=>objetivo.saqueo()})
	}
	
	method valeLaPenaLaExpedicion(){
		return objetivos.all({objetivo=>objetivo.valeLaPena()})
	}
	method subirVikingo(vikingo){
		if(vikingo.esProductivo()){
			tripulacion.add(vikingo)
		}
		else{
		throw new 	ExceptionNoPuedeSubirAExpedicion(message="no puede ir de expedicion")
		}
	}
	method agregarObjetivos(objetivo){
		objetivos.add(objetivo)
	}
	method repartirBotin(botin){
		const botinPorPersona = botin.div(self.cantidadDeTripulantes())
		tripulacion.forEach({tripulante=>tripulante.agregarOro(botinPorPersona)})
	}
}

class Lugar{
	method nosInvaden(expedicion){
		expedicion.repartirBotin(self.botin(expedicion))
		self.saqueo(expedicion.cantidadDeTripulantes())
		
	}
	method botin(expedicion)
	method saqueo(vikingos)
}


class Capital inherits Lugar{
	var property factorDeRiqueza
	var property defensores
	override method botin(expedicion){
		return expedicion.cantidadDeTripulantes()+factorDeRiqueza
	}
	method valeLaPena(expedicion){
		return expedicion.cantidadDeTripulantes() *3 < self.botin(expedicion)
	}
	override method saqueo(vikingos){
		defensores-=vikingos
	}
}

class Aldea inherits Lugar{
	var property iglesias
	override method botin(expedicion){
		return iglesias.sum({iglesia=>iglesia.cantidadDeCrusifijos()})
	}
	method valeLaPena(expedicion){
		return 15 < self.botin(expedicion)
	}
	override method saqueo(vikingos){
		iglesias.forEach({iglesia=>iglesia.vaciariglesia()})
	}
}

class AldeaAmurrallada inherits Aldea{
	var property vikingosEnComitiva
	override method valeLaPena(expedicion){
		return super(expedicion) && expedicion.cantidadDeTripulantes()>vikingosEnComitiva
	}
}

class Iglesias{
	var property cantidadDeCrusifijos
	
	method vaciariglesia(){
		cantidadDeCrusifijos=0
	}
}

class ExceptionNoPuedeSubirAExpedicion inherits Exception{}