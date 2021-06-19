class Cerveza
{
	var property contLupulo
	var property pais
}

class Rubia inherits Cerveza
{
	var property graduacion
}

class Negra inherits Cerveza
{
	var property graduacionReglamentaria
	
	method graduacion()
	{
		return graduacionReglamentaria.min(contLupulo * 2)
	}
}


class Roja inherits Negra
{
	override method graduacion()
	{
		return super() * 1.25
	}
}


class Jarra
{
	var property capacidad
	var property marca
	
	method contenidoDeAlcohol()
	{
		return capacidad * (marca.graduacion() / 100)
	}
}



