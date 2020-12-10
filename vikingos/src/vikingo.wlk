class Vikingo {
	var property armas
	var property casta
	var property oro
	
	method ascenderDeEscalaSocial(){
		casta.ascender(self)
	}
	method tieneArmas(){
		return  armas > 0
	}
	method esProductivo(){
		return (casta.sosEsclavo() && !self.tieneArmas()) || !casta.sosEsclavo() 
	}
	
	method agregarOro(cantidad){
		oro+=cantidad
	}
	
}

class Soldado inherits Vikingo{
	var property cantidadDeVidasCobradas
	
	override method esProductivo(){
		return super() &&  cantidadDeVidasCobradas > 20 && self.tieneArmas()
	}
	
	method mejoraPorAscenso(){
		cantidadDeVidasCobradas+=10
	}
	
}

class Granjero inherits Vikingo{
	var property hijos
	var property hectareas
	
	override method esProductivo(){
		return super() &&  hijos *2 < hectareas
	}
	method mejoraPorAscenso(){
	hijos+=2
	hectareas+=2
	}
	
}

object jarl{
	method sosEsclavo(){
		return true
	}
	method ascender(vikingo){
		vikingo.casta(karl)
		vikingo.mejoraPorAscenso()
	}
}

object karl{
	method sosEsclavo(){
		return false
	}
	method ascender(vikingo){
		vikingo.casta(thrall)
	}
}

object thrall{
	method sosEsclavo(){
		return false
	}
	method ascender(vikingo){
		
	}
}