import animales.*
import conspiraciones.*


class Personaje{
	var casa 
	var conyuges = []
	var patrimonio
	var estaVivo 
	var acompaniantes = []
	var aliados = []
	var personalidad
	
	method casa(){
		return casa
	}
	
	method casarse(personaje){
		var casaDeInteresado = personaje.casa()
		if(casa.permiteCasamiento(self,personaje) and casaDeInteresado.permiteCasamiento(personaje,self)){
			self.agregarConyuge(personaje)
			personaje.agregarConyuge(self)
		}
	}
	method agregarConyuge(conyuge){
		conyuges.add(conyuge)
	}
	method calularPatrimonio(){
		patrimonio = (casa.patrimonio() / casa.cantMiembros())
	}
	method patrimonio(){
		return patrimonio
	}
	method conyuges(){
		return conyuges
	}
	method cantidadConyuges(){
		return conyuges.size()
	}
	method agregarAcompaniante(acompaniante){
		acompaniantes.add(acompaniante)
	}
	method estaSolo(){
		return acompaniantes.size() == 0
	}
	method acompaniantes(){
		return acompaniantes
	}
	method calcularAliados(){
		aliados = self.conyuges() + self.acompaniantes() + casa.miembros()
	}
	method esDeCasaRica(){
		return casa.esRica()
	}
	method esPeligroso(){
		return aliados.sum({aliado => aliado.patrimonio()}) > 10000 or conyuges.all({conyuge => conyuge.esDeCasaRica()}) or aliados.any({aliado => aliado.esPeligroso()})
			
	}
	method estaVivoYSoltero(){
		return estaVivo and self.cantidadConyuges() == 0
	}
    method serAsesinado(){
    	estaVivo = false
    }
	method derrocharFortuna(porcentaje){ // ej 0.5
		patrimonio = patrimonio * porcentaje
	}
	method esAliado(personaje){
		return aliados.contains(personaje)
	}
	method ejecutarComplot(objetivo,conspiracion){
		personalidad.actuar(objetivo,conspiracion)
	}
	
}

class Casa{
	var patrimonio = 0
	var ciudad
	var miembros = []
	
	method permiteCasamiento(miembro,extranio){
		return true
	}
	method esFamiliar(personaje){
		return personaje.casa() == self
	}
	method patrimonio(){
		return patrimonio
	}
	method agregarPatrimonio(valor){
		patrimonio += valor
	}
	method cantMiembros(){
		return miembros.size()
	}
	method miembros(){
		return miembros
	}
	method esRica(){
		return patrimonio > 1000 
	}
	method vivosYSolteros(){
	    return miembros.filter({miembro => miembro.estaVivoYSoltero()})
	}
	
}

object lannister inherits Casa{
	override method permiteCasamiento(miembro,extranio){
		if(miembro.cantidadConyuges() < 1){
			return true
		}
		else{
		    self.error("No se permite poligamia")
		    return false
		}
	}
}

object stark inherits Casa{
	override method permiteCasamiento(miembro,extranio){
		if(not(self.esFamiliar(extranio))){
			return true
		}
		else{
			self.error("No se permite casamiento entre familia")
			return false
		}
	}
}

object guardiaDeLaNoche inherits Casa{
     override method permiteCasamiento(miembro,extranio){
     	self.error("No se permite ningun casamiento")
     	return false
     }
}




//







