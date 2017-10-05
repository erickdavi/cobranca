@cache = []
@dir_input = "../in/"
def selecionar_ano(ano)
	arquivo = File.open(@dir_input+ano.to_s+'.csv', 'r')
	if arquivo	
		arquivo.each do |arq|
			while linha = arq.gets
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
			end
		end		
	else
			out = "Ano inexistente"	
	end	
end

a = selecionar_ano(2013)
