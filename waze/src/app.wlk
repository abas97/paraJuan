object app {
	var property usuarios
	var property zonas
	
	method pagarSusMultas(){
		usuarios.forEach({usuario=>usuario.pagarTodasLasMultas()})
	}
	method zonaMasTransitada(){
		return zonas.max({zona=>zona.cantidadDeUsariosTransitando()})
	}
	method usuariosComplicados(){
		return usuarios.filter({usuario=>usuario.esUsuarioComplicado()})
	}
}
