object productora {
  const bandas = []
  const asistentes = []
  var property impuestos = 0

  method registrarBanda(unaBanda) {
    bandas.add(unaBanda)
  }

  method registrarAsistente(unAsistente) {
    asistentes.add(unAsistente)
  }

  method gananciaTotal() {
    return self.recaudacionTotal() - self.presupuestoTotal()
  }

  method recaudacionTotal() {
    return asistentes.sum({ asistente =>
      asistente.entradasCompradas().sum({ entrada =>
        entrada.precioFinal()
      })
    })
  }

  method presupuestoTotal() {
    return bandas.sum({ banda =>
      banda.presupuesto()
    })
  }

  method cantidadEntradasVendidas() {
    return asistentes.sum({ asistente =>
      asistente.entradasCompradas().size()
    })
  }

  method cantidadEntradasVendidasDe(unaBanda) {
    return asistentes.sum({ asistente =>
      asistente.entradasCompradas().count({ entrada =>
        entrada.banda() == unaBanda
      })
    })
  }

  method bandaMasPopular() {
    if (bandas.isEmpty()) {
      return null
    }

    var masPopular = bandas.first()

    bandas.forEach({ banda =>
      if (
        self.cantidadEntradasVendidasDe(banda) >
        self.cantidadEntradasVendidasDe(masPopular)
      ) {
        masPopular = banda
      }
    })

    return masPopular
  }

  method bonificarVip(unVip) {
    unVip.bonificar()
  }
}




