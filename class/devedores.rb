@cache = Array.new
@dir_input = "../in/devedores/"

def selecionar_ano(ano)
	arq_base = @dir_input+ano.to_s+'.csv'
	
	if File.exist?(arq_base)
		File.open(arq_base, 'r') do |arquivo|
			while linha = arquivo.gets
				coluna = linha.split(',')
				cacheline = {
						Mat: coluna[0],	Descricao: coluna[1],	DtVenc: coluna[2],	Valor: coluna[3],	
						NomeResp: coluna[4],	TelefoneResp: coluna[5],	cpfresp: coluna[6]

				}
			@cache.push(cacheline)
			end	
		end
		out = "Arquivo #{arq_base} carregado com sucesso"		
	else
		out = "Arquivo #{arq_base} não encontrado"
	end 
end

 a = selecionar_ano(2014)
 puts a
 
@cache.shift
puts @cache[0]
