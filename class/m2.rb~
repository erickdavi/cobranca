@cache = Array.new
@dir_input = "../in/"

def selecionar_ano(ano)
	arq_base = @dir_input+ano.to_s+'.csv'
	
	if File.exist?(arq_base)
		File.open(arq_base, 'r') do |arquivo|
			while linha = arquivo.gets
				coluna = linha.split(',')
				cacheline = {
					Mat: coluna[0], Nome: coluna[1], Telefone: coluna[2], TelEmpresaMae: coluna[3], TelEmpresaPai: coluna[4], 
					AnoLetivo: coluna[5], Descricao: coluna[6], Serie: coluna[7], Turma: coluna[8], Turno: coluna[9], Numero: coluna[10], 
					FilhoFuncionario: coluna[11],Situacao: coluna[12], NomeMae: coluna[13], NomePai: coluna[14], NomeResp: coluna[15]
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
 