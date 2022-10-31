class Empleado{
	
	var property rol
	var property stamina
	var property tareasRealizadas = []
	var property danio
	
	method ojos()
	

	method experiencia(){
		return (tareasRealizadas.length()*tareasRealizadas.sum({tarea => tarea.dificultad(self)}))
	}
	
		
	method dificultad(Tarea)
	
	method hacerTarea(tarea){
		if (tarea.puedeHacerla(self)){
			stamina -= tarea.perdidaStamina()
		}
	}
	
	method fuerza(){
		return stamina/2+2+danio
	}
	
}

class Biclopes inherits Empleado{
	
	override method ojos(){
		return 2
	}
}

class Empleo{
	
	method aumentoDanio() = 0	
	
	method tieneHerramienta(herramienta) = false
	
}

class Obrero inherits Empleo{
	
	const herramientas = []
	
	override method tieneHerramienta(herramienta) = herramientas.contains(herramienta)
}

class Soldado inherits Empleo{
		
	override method aumentoDanio() = 2
	
	
}

class Mucama inherits Empleo{
	
}

class Maquina{
	
	var property herramientasNecesarias = []
	var property complejidad
}

class tarea{
	
	method puedeHacerla(persona)
	
	method perdidaStamina(persona)
	
	method accion(persona)
		
	method dificultad(persona)
}

class ArreglarMaquina inherits tarea{
	
	var property maquina
	
	override method puedeHacerla(persona){
		
		return (persona.stamina() >= maquina.complejidad() && maquina.herramientasNecesarias().all({herramienta => persona.tieneHerramienta(herramienta)}))
	}
	
	override method perdidaStamina(persona){
		return maquina.complejidad()
	}
	
	override method dificultad(persona){
		return maquina.complejidad()*2
	}
	
}

class DefenderSector inherits tarea{
	
	override method puedeHacerla(persona){
		persona.puedeDefenderSector()
	}
}


