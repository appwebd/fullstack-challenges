def ip_to_num(ip_address)
  # convert to array of base 2 binary numbers as strings
  binary_components = ip_address.split('.').map { |num| num.to_i.to_s(2).rjust(8, '0') }
  # join them together and convert back to a base 10 integer
  binary_components.join.to_i(2)
end

def num_to_ip(number)
  # convert to array of base 10 decimal numbers as strings
  decimal_components = number.to_s(2).rjust(32, '0').scan(/.{8}/).map { |num| num.to_i(2) }
  # join them together with a dot
  decimal_components.join('.')
end
