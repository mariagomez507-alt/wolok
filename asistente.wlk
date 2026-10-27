import exception.*
import entrada.*

class Asistente {
  const historialDeEntradas = []
  var property dineroDisponible

  method comprarEntrada(unaEntrada) {
    if (dineroDisponible > 0) {
      historialDeEntradas.add(unaEntrada)
      self.descontarMontoDeEntrada(unaEntrada)
    } else {
      throw new NoPuedeComprarEntradaException()
    }
  }

  method descontarMontoDeEntrada(unaEntrada) {
    dineroDisponible = dineroDisponible - self.montoAPagar(unaEntrada)
  }

  method montoAPagar(unaEntrada) {
    unaEntrada.precioFinal()
  }

  method entradasCompradas() {
    return historialDeEntradas
  }

  method entradasDelAnoAnterior() {
    return historialDeEntradas.filter({ entrada =>
      entrada.esDelAnoAnterior()
    })
  }

  method bandasQueVio() {
    return historialDeEntradas.map({ entrada =>
      entrada.banda().nombre()
    })
  }
}

class Fan inherits Asistente {
}

class Vip inherits Asistente {
  var property porcentaje

  override method montoAPagar(unaEntrada) {
    super()
      - (unaEntrada.precioFinal() * porcentaje / 100)
  }

  method bonificar() {
    porcentaje = porcentaje + 1
  }
}











