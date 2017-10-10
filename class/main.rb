class Cobranca
	attr_accessor :ano
	def initialize(ano)
		#Inicializa as variáveis de configuração		
		@ano = ano
		@cache_cadastro = Array.new
		@cache_devedores = Array.new
		@cache_out
		@dir_input = ["../in/cadastro/", "../in/devedores/"]
		@arq_base0 = @dir_input[0]+ano.to_s+'.csv'
		@arq_base1 = @dir_input[1]+ano.to_s+'.csv'
		@arq_output = "../out/"+ano.to_s+".csv"		

		if File.exist?(@arq_base0) && File.exist?(@arq_base1)
			File.open(@arq_base0, 'r') do |arquivo|
				while linha = arquivo.gets
					coluna = linha.split(',')
					cacheline = {
						Mat: coluna[0], Nome: coluna[1], Telefone: coluna[2], TelEmpresaMae: coluna[3], 
						TelEmpresaPai: coluna[4], AnoLetivo: coluna[5], Descricao: coluna[6], 
						Serie: coluna[7], Turma: coluna[8], Turno: coluna[9], Numero: coluna[10], 
						FilhoFuncionario: coluna[11],Situacao: coluna[12], NomeMae: coluna[13], NomePai: coluna[14], NomeResp: coluna[15]
					}
				@cache_cadastro.push(cacheline)
				end
			end		
			File.open(@arq_base1, 'r') do |arquivo|
				while linha = arquivo.gets
					coluna = linha.split(',')
					cacheline = {				
					Mat: coluna[0],	Descricao: coluna[1],	DtVenc: coluna[2],	Valor: coluna[3],	
					NomeResp: coluna[4], TelefoneResp: coluna[5], cpfresp: coluna[6]
				}
				@cache_devedores.push(cacheline)
				end
			end		
		else
			out = false
		end		
	end
end