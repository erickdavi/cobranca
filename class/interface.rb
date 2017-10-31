require "./main.rb"

puts "Digite o ano de referência"
ano = gets
file = "#{ano}.csv"


cob = Cobranca.new(ano)

cache = cob.join_tabs
csv_cache = cob.format_tab(cache)

puts csv_cache
#File.new(file,"w").puts(csv_cache)