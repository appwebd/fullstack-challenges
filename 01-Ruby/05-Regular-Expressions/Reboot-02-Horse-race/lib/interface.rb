# Definir el listado de caballos
#
horses = %w[Caballito Spider Blanco Negro Pelado Pellejo Risueño Veloz]

# Darle la bienvenida al usuario
#
puts "*" * 30
puts "Bienvenido a la carrera de caballos"
puts "*" * 30

# Mostrar el listado de caballos
#
puts "Listado de caballos"
p horses

# Preguntar cual caballo quiere y guardar la seleccion
#
puts "Qué caballo desea correr?"
puts "Ingrese el nombre de tu selección (Nombre de caballo)"
horse_selected = gets.chomp
# Correr la carrera (tomar un caballo al azar)
horse_winner = rand(0..3)

# Entregar el resultado
#
if horses[horse_winner].downcase == horse_selected.downcase
  celebration = "Tu caballo es el ganador"
else
  celebration = "Lo siento, tu caballo ha llegado último"
end

# Mensaje de salida
#
puts "*" * 30
puts "Resultado carrera: Caballo ganador #{horses[horse_winner]}\n#{celebration}"
puts "*" * 30
