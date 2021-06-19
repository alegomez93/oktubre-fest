import cervezas.*

class Persona
{
	var property peso
	const property jarrasDeCervezas = []
	var property musicaTradicional = true
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
}


class Belga inherits Persona
{
	method leGustaLaCerveza(marca)
	{
		return marca.contLupulo() > 4
	}
}


class Checo inherits Persona
{
	method leGustaLaCerveza(marca)
	{
		return marca.graduacion() > 8
	}
}


class Aleman inherits Persona
{
	method leGustaLaCerveza(marca)
	{
		return true
	}
}