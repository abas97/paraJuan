import ninos.*
class Adulto {
	var property ninosQueIntentaronAsustarlo
	
	method cantidadDeNinosConMasDe15Caramelos(){
		return ninosQueIntentaronAsustarlo.filter({nino=>nino.cantidadDeCaramelos()>15}).size()
	}
	method tolerancia(){
		return self.cantidadDeNinosConMasDe15Caramelos() * 10
	}
	method sePuedeAsustar(nino){
		return self.tolerancia() < nino.capacidadDeSusto()
	}
	method carameloADar(){
		return self.tolerancia() /2
	}
	
	method loTratanDeAsustar(nino){
		if(self.sePuedeAsustar(nino)){
			return self.carameloADar()
		}
		else{
			ninosQueIntentaronAsustarlo.add(nino)
			return 0
		}
	}
	
}

class Abuelo inherits Adulto{
	override method sePuedeAsustar(nino){
		return true
	}
	override method loTratanDeAsustar (nino){
		return self.carameloADar()/2
		
	}
}

class AdultoNecio inherits Adulto{
	override method loTratanDeAsustar(nino){
		return 0
	}
}
