class Vehiculo{
	var property capacidadTanque
	var property cantCombustible
	var property velocidadPromedio
	
	method consumo(unaDistancia)=2
	method puedeRecorrerDistancia(unaDistancia){
		return cantCombustible>=self.consumo(unaDistancia)
	}
	
	method recorrerDistancia(unaDistancia){
		if(self.puedeRecorrerDistancia(unaDistancia)){
			cantCombustible-=self.consumo(unaDistancia)
		}
		else{
		throw new NoHayCombustibleSuficiente(message="no hay combistible suficiente")
		}
	}
	method cargaDenafta(unaCantidad){
		if((unaCantidad+cantCombustible)>capacidadTanque){
			cantCombustible+=(capacidadTanque-cantCombustible)
			return (capacidadTanque-cantCombustible)*40
		}
		else{
			return unaCantidad*40
		}
	}
	method esEcologico()
	
}

class Camioneta inherits Vehiculo{
	override method consumo(unaDistancia){
		return 4+5*unaDistancia
	}
	override method esEcologico(){
		return false
	}
}
class Deportivo inherits Vehiculo{
	override method consumo(unaDistancia){
		return super(unaDistancia) + 0.2 *velocidadPromedio
	}
	override method esEcologico(){
		return velocidadPromedio<120
	}
}
class Familiares inherits Vehiculo{
	override method esEcologico(){
		return true
	}
}
class NoHayCombustibleSuficiente inherits Exception{}