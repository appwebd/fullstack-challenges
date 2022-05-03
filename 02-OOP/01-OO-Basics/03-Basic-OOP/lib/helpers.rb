def pluralize(integer, string)
  message = "#{integer} #{string}"
  message.concat(message, 's') if integer > 1
end
