import animales.*
import example.*


class Conspiracion{
	var objetivo
	var complotados = []
	
	var casas = []
	
	method laMasPobre(){
		return casas.min({casa => casa.patrimonio()})
	}
	
	method traidores(){
		var traidores complotados.filter({complotado => objetivo.esAliado(complotado)})
		return traidores.size()
	}
	
	method ejecutar(){
		complotados.forEach({complotado => complotado.ejecutarComplot(objetivo,self)})
	}
	method objetivoCumplido(){
		return not(objetivo.esPeligroso())
	}
	
}


class Personalidad {
	method actuar(objetivo,conspiracion){
		
	}
}

object sutil inherits Personalidad{
	override method actuar(objetivo,conspiracion){
		var laMasPobre = conspiracion.laMasPobre()
		var losVivosYSolteros = laMasPobre.vivosYSolteros()
		var personajePobre = losVivosYSolteros.first()	
		if(laMasPobre.permiteCasamiento(personajePobre,objetivo)){
		  objetivo.casarse(personajePobre)
		}
		else{
			self.error("No se puede llevar a cabo la boda")
		}
	}
}

object asesino inherits Personalidad{
	override method actuar(objetivo,conspiracion){
		objetivo.serAsesinado()
	}
}

object asesinoPrecavido inherits Personalidad{
	override method actuar(objetivo,conspiracion){
		if(objetivo.estaSolo()){
			objetivo.serAsesinado()
		}
	}
}

object disipado inherits Personalidad{
	var porcentaje 
	method cambiarPorcentaje(porcentajeNuevo){
		porcentaje = porcentajeNuevo
	}
	override method actuar(objetivo,conspiracion){
		objetivo.derrocharFortuna(porcentaje)
	}
}


object miedoso inherits Personalidad{
	override method actuar(objetivo,conspiracion){
		
	}
}
