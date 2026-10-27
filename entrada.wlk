import productora.*

class Entrada {
  const property banda
  const property fechaDeToque
  const precioBase = 1000

  method precioFinal() = precioBase + productora.impuestos()

    method esDelAnoAnterior() {
    return fechaDeToque.year() == new Date().year() - 1
  }
}

