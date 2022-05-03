def calculate(first_number, second_number, operator)
  return case operator
         when '+' then first_number.to_i + second_number.to_i
         when '-' then first_number.to_i - second_number.to_i
         when '*' then first_number.to_i * second_number.to_i
         when '/' then first_number.to_i / second_number.to_i unless second_number.to_i.zero?
         end
end
