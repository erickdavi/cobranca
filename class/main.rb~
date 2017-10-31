class Cobranca
	attr_accessor :ano
	def initialize(ano)
		#Inicializa as variáveis de configuração		
		@ano = ano
		@cache_cadastro = Array.new
		@cache_devedores = Array.new
		@pre_cache_out = Array.new
		@dir_input = ["../in/cadastro/", "../in/devedores/"]
		@arq_base0 = @dir_input[0]+ano.to_s+'.csv'
		@arq_base1 = @dir_input[1]+ano.to_s+'.csv'
		@arq_output = "../out/#{ano.to_s}.csv"
		self.init_cad
		self.init_dev
	end

	protected def init_cad
		if File.exist?(@arq_base0)
			File.open(@arq_base0, 'r') do |arquivo|
				while linha = arquivo.gets
					coluna = linha.split(',')
					cacheline = 
					{
						Mat: coluna[0].chomp, Nome: coluna[1].chomp, Telefone: coluna[2].chomp, TelEmpresaMae: coluna[3].chomp, 
						TelEmpresaPai: coluna[4].chomp, AnoLetivo: coluna[5].chomp, Descricao: coluna[6].chomp, 
						Serie: coluna[7].chomp, Turma: coluna[8].chomp, Turno: coluna[9].chomp, Numero: coluna[10].chomp,
						FilhoFuncionario: coluna[11].chomp,Situacao: coluna[12].chomp, NomeMae: coluna[13].chomp,
						NomePai: coluna[14].chomp, NomeResp: coluna[15].chomp
					}
					@cache_cadastro.push(cacheline)
				end
			end
			@cache_cadastro.shift
			cache_temp = @cache_cadastro
			@cache_cadastro = cache_temp.sort_by{|hsh| hsh[:Mat]}
			out = true
		else
			out = false
		end
	end

	protected def init_dev
		if File.exist?(@arq_base1)
			File.open(@arq_base1, 'r') do |arquivo|
				while linha = arquivo.gets
					coluna = linha.split(',')
					cacheline =
						{
							Mat: coluna[0].chomp, Descricao: coluna[1].chomp,	DtVenc: coluna[2].chomp,	Valor: coluna[3].chomp,	
							NomeResp: coluna[4].chomp, TelefoneResp: coluna[5].chomp, cpfresp: coluna[6].chomp
						}
					@cache_devedores.push(cacheline)
				end
			end
			@cache_devedores.shift
			cache_temp = @cache_devedores
			@cache_devedores = cache_temp.sort_by {|hsh| hsh[:Mat]}
			out = true
		else
			out = false
		end
	end
	
	def get_cache(esp)
		if esp == "dev"
			out = @cache_devedores
		elsif esp == "cad"
			out = @cache_cadastro
		elsif esp == "ano"
			out @ano
		else
			out = false			
		end	
	end
	def join_tabs
		out = Array.new
		alunos = @cache_cadastro
		dividas = @cache_devedores
		alunos.product(dividas) do |arr|
			if arr[0][:Mat] == arr[1][:Mat]
				instituicao = "COLÉGIO EUCARÍSTICO"
				responsavel = arr[1][:NomeResp].chomp
				cpf = arr[1][:cpfresp].chomp
				logradouro_res = ""
				bairro_res = ""
				cidade_res = ""
				uf_res = ""
				cep_res = ""
				tel_res = ""
				tel_com = ""
				cel = arr[1][:TelefoneResp].chomp
				nome_aluno = arr[0][:Nome].chomp
				curso = arr[0][:Descricao].chomp
				matricula = arr[0][:Mat].chomp
				parcela = arr[1][:DtVenc].split("/")[1].chomp
				vencimento = arr[1][:DtVenc].chomp
				valor = arr[1][:Valor].chomp
				ln = {
					Inst: instituicao, Resp: responsavel, CPF: cpf, Log: logradouro_res, Bairro: bairro_res, 
					Cidade: cidade_res, UF: uf_res, CEP: cep_res, Tel: tel_res, TelCom: tel_com, Cel: cel, 
					Aluno: nome_aluno, Curso: curso, Matr: matricula, Parc: parcela, Venc: vencimento, Val: valor
				}
				out.push(ln) 	
			end	
			
		end
	@pre_cache_out = out	
	end	
	def format_tab(tab)
		fcache = "Instituição,Nome do Responsável,Cpf/Cnpj,Logradouro_res,Bairro_res,Cidade_res,UF_res,Cep_Res,Tel_Res,Tel_com,Tel_cel,Nome do Aluno,Curso,Matricula,Parcela,Vencimento,Valor\n"
		
		tab.each	do |line|
			fcache = fcache + "#{line[:Inst]},#{line[:Resp]},#{line[:CPF]},#{line[:Log]},#{line[:Bairro]},#{line[:Cidade]},#{line[:UF]},#{line[:CEP]},#{line[:Tel]},#{line[:TelCom]},#{line[:Cel]},#{line[:Aluno]},#{line[:Curso]},#{line[:Matr]},#{line[:Parc]},#{line[:Venc]},#{line[:Val]}\n"
		end
		File.new(@arq_output,'w').puts(fcache)	
		return fcache
	end
end