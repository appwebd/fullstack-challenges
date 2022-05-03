class Imprenta
  attr_accessor :tipo_papel, :cantidad, :color

  TIPO_PAPEL = %w[bond couche]
  COLORS = %w[blanco negro amarillo]

  def initialize(tipo_papel_def = 'bond', cantidad_def = 1, color_def = 'blanco')
    @tipo_papel = tipo_papel_def
    @cantidad = cantidad_def
    @color = color_def
  end

  def tipo_papel_mostrar
    TIPO_PAPEL
  end

  def tipo_papel_cambie(nuevo_tipo_papel)
    @tipo_papel = nuevo_tipo_papel
  end

  def tipo_papel_que_tiene
    TIPO_PAPEL[rand(0..1)]
  end

  def pedido
    "Su pedido es: #{@tipo_papel} #{@cantidad} #{@color}"
  end

  def color_que_tiene
    COLORS
  end
end
