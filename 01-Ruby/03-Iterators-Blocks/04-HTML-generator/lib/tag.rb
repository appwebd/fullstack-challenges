# Build HTML tags around content given in the block
# The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
def tag(tag_name, attributes = nil)
  key = ''
  value = ''
  unless attributes.nil?
    key.concat(' ', attributes[0], '=')
    value.concat('"', attributes[1], '"')
  end
  content = yield
  result = ''
  result.concat('<', tag_name, key, value, '>', content, '</', tag_name, '>')
end
