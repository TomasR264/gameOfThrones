import conspiraciones.*
import example.*


class Animal{
	const patrimonio = 0
	method patrimonio(){
		return patrimonio
	}
	method esPeligroso(){
		return true
	}
}

class Lobo inherits Animal{
	var esHuargo 
	
	override method esPeligroso(){
		return esHuargo
	}
}

class Dragon inherits Animal{
	
}
