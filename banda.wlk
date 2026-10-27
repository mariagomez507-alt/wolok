class Banda {
  const property nombre
  var canon = 1000000

  method calcularCanon() = canon

  method gastoExtra()

  method calcularPopularidad() 

  method presupuesto() {
    return self.calcularCanon() + self.gastoExtra()
  }
}

class Rock inherits Banda {
  const property solosDeGuitarra

  override method gastoExtra() = 10000

  override method calcularPopularidad() {
    return 100 * solosDeGuitarra
  }
}

class Trap inherits Banda {
  const property tieneHielo

  override method gastoExtra() = 0

  override method calcularPopularidad() {
    if (tieneHielo) {
      return 1000
    } else {
      return 0
    }
  }

  override method calcularCanon() {
    return 1000000 * self.calcularPopularidad()
  }
}

class Indies inherits Banda {
  const property cantidadDeInstrumentos

  override method calcularPopularidad() {
    return 3.14 * nombre().size()
  }

  override method gastoExtra() {
    return 500 * cantidadDeInstrumentos
  }
}


