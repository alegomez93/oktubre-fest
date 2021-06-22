import cervezas.*
import carpas.*

class UserException inherits Exception { }


class Persona
{
	var property peso
	const property jarrasDeCervezas = []
	var property musicaTradicional
	var property nivelDeAguante
	
	method comprarCerveza(unaJarra)
	{
		jarrasDeCervezas.add(unaJarra)
	}
	
	method cantidadDeAlcoholIngerido()
	{
		return jarrasDeCervezas.sum( {j => j.contenidoDeAlcohol()} )
	}
	
	method estaEbria()
	{
		return (self.cantidadDeAlcoholIngerido() * peso) > nivelDeAguante
	}
	
	method quiereEntrarA(unaCarpa)
	{
		return unaCarpa.bandaTradicional() == self.musicaTradicional()
	}
	
	method puedeEntrarA(unaCarpa)
	{
		return self.quiereEntrarA(unaCarpa) and unaCarpa.permitirIngresar(self)
	}
	
	method entrarA(unaCarpa)
	{
		if (self.puedeEntrarA(unaCarpa))
			unaCarpa.ingresar(self)
		else
			throw new UserException(message = "Las condiciones no estan dadas para que la persona entre a la carpa")
	}
	
	method esEbrioEmpedernido()
	{
		return jarrasDeCervezas.all( { j => j.capacidad() >= 1} )
	}
	
	method esPatriota()
	{
		return jarrasDeCervezas.map( { j => j.marca()} )
	}
}


class Belga inherits Persona
{
	method leGustaLaCerveza(marca)
	{
		return marca.contLupulo() > 4
	}
	
	override method quiereEntrarA(unaCarpa)
	{
		return super(unaCarpa) and self.leGustaLaCerveza(unaCarpa.marcaDeCeveza())
	}
	
	override method esPatriota()
	{
		return super().all( { p => p.pais() == "Belgica"} )
	}
}


class Checo inherits Persona
{
	method leGustaLaCerveza(marca)
	{
		return marca.graduacion() > 8
	}
	
	override method quiereEntrarA(unaCarpa)
	{
		return super(unaCarpa) and self.leGustaLaCerveza(unaCarpa.marcaDeCeveza())
	}
	
	override method esPatriota()
	{
		return super().all( { p => p.pais() == "Republica Checa"} )
	}
}


class Aleman inherits Persona
{
	method leGustaLaCerveza(marca)
	{
		return true
	}
	
	override method quiereEntrarA(unaCarpa)
	{
		return super(unaCarpa) and unaCarpa.genteEnLaCarpa().size().even()
	}
	
	override method esPatriota()
	{
		return super().all( { p => p.pais() == "Alemania"} )
	}
}