@arquivo_cache = []
File.open("2013.csv", "r") do |arquivo|
	while linha = arquivo.gets
		coluna = linha.split(',')
		cont_linha = {	
			Mat: coluna[0], Nome: coluna[1], 
			Telefone: coluna[2], TelEmpresaMae: coluna[3], 
			TelEmpresaPai: coluna[4], AnoLetivo: coluna[5], 
			Descricao: coluna[6], Serie: coluna[7], 
			Turma: coluna[8], Turno: coluna[9], 
			Numero: coluna[10], FilhoFuncionario: coluna[11], 
			Situacao: coluna[12], NomeMae: coluna[13], 
			NomePai: coluna[14], NomeResp: coluna[15]
		}
		@arquivo_cache.push(cont_linha) 
	end
	#puts @arquivo_cache[0]
	puts @arquivo_cache[1]
end




