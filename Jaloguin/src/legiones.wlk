import ninos.*
class Legiones {
	var property integrantes
	
	method capacidadDeSusto(){
		return integrantes.sum({nino=>nino.capacidadDeSusto()})
	}
	method cantidadDeCaramelosDeLaLegion(){
		integrantes.sum({nino=>nino.cantidadDeCaramelos()})
	}
	
	method liderDeLaLegion(){
		return integrantes.max({nino=>nino.capacidadDeSusto()})
	}
	method asustarAdulto(adulto){
		const lider= self.liderDeLaLegion()
		integrantes.forEach({nino=>lider.sumarCaramelos(nino.darCaramelosAlLider(adulto))})
	}
	
}
