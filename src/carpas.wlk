import personas.*
import cervezas.*

class Carpa
{
	var property limiteDeGente
	var property bandaTradicional
	var property marcaDeCeveza
	const property genteEnLaCarpa = []
	
	method ingresar(unaPersona)
	{
		genteEnLaCarpa.add(unaPersona)
	}
	
	method retirar(unaPersona)
	{
		genteEnLaCarpa.remove(unaPersona)
	}
	
	method permitirIngresar(unaPersona)
	{
		return (genteEnLaCarpa.size() +1 <= limiteDeGente) and not unaPersona.estaEbria()
	}
	
	method servirJarra(unaPersona, cantidad)
	{
		if (genteEnLaCarpa.contains(unaPersona))
			unaPersona.comprarCerveza(new Jarra(capacidad = cantidad, marca = marcaDeCeveza))
		
		else
			throw new UserException(message = "La persona no se encuentra en la carpa")
	}
	
	method cantidadDeEbriosEmpedernidos()
	{
		return genteEnLaCarpa.count( {p => p.esEbrioEmpedernido()} )
	}
}