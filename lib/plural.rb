class String
  define_method(:plural?) do
    self[-1, 1].eql?('s')
  end
end
