require_relative "imprenta"

imprenta_juanito = Imprenta.new('bond', 1, 'blanco')
puts "Tipos de papel disponibles: #{imprenta_juanito.tipo_papel_mostrar}"
puts "Qué papel me recomienda: #{imprenta_juanito.tipo_papel_que_tiene}"
puts "Cuál es mi pedido?: #{imprenta_juanito.pedido}"
