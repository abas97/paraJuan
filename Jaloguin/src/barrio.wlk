import ninos.*
class Barrio {
	var property ninos
	
	method top3Ninios(){
		return ninos.sortedBy({unNinio, otroNinio => unNinio.cantidadDeCaramelos() > otroNinio.cantidadDeCaramelos()}).take(3)
	}
	method los10NiciosConMasCaramelos(){
		return ninos.filter({ninio=>ninio.cantidadDeCaramelos()>10})
	}
	method elementosUsadosPorLosNinos(){
		self.los10NiciosConMasCaramelos().flatMap({nino=>nino.elementoPuestos()}).asSet()
	}
}
