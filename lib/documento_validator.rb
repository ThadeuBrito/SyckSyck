class DocumentoValidator < ActiveModel::EachValidator
	def validate_each(record, attr_name, value)
		valor = value.scan /[0-9]/
		if valor.length == 11
			nulos = %w{12345678909 11111111111 22222222222 33333333333 44444444444 55555555555 66666666666 77777777777 88888888888 99999999999 00000000000}
			unless nulos.member?(valor.join)
				valor = valor.collect{|x| x.to_i}
				soma = 10*valor[0]+9*valor[1]+8*valor[2]+7*valor[3]+6*valor[4]+5*valor[5]+4*valor[6]+3*valor[7]+2*valor[8]
				soma = soma - (11 * (soma/11))
				resultado1 = (soma == 0 or soma == 1) ? 0 : 11 - soma
				if resultado1 == valor[9]
					soma = valor[0]*11+valor[1]*10+valor[2]*9+valor[3]*8+valor[4]*7+valor[5]*6+valor[6]*5+valor[7]*4+valor[8]*3+valor[9]*2
					soma = soma - (11 * (soma/11))
					resultado2 = (soma == 0 or soma == 1) ? 0 : 11 - soma
					return true if resultado2 == valor[10] # CPF valido
				end
			end
		elsif valor.length == 14
			nulos = %w{11111111111111 22222222222222 33333333333333 44444444444444 55555555555555 66666666666666 77777777777777 88888888888888 99999999999999 00000000000000}
			unless nulos.member?(valor.join)
				valor = valor.collect{|x| x.to_i}
				soma = valor[0]*5+valor[1]*4+valor[2]*3+valor[3]*2+valor[4]*9+valor[5]*8+valor[6]*7+valor[7]*6+valor[8]*5+valor[9]*4+valor[10]*3+valor[11]*2
				soma = soma - (11*(soma/11))
				resultado1 = (soma==0 || soma==1) ? 0 : 11 - soma
				if resultado1 == valor[12]
					soma = valor[0]*6+valor[1]*5+valor[2]*4+valor[3]*3+valor[4]*2+valor[5]*9+valor[6]*8+valor[7]*7+valor[8]*6+valor[9]*5+valor[10]*4+valor[11]*3+valor[12]*2
					soma = soma - (11*(soma/11))
					resultado2 = (soma == 0 || soma == 1) ? 0 : 11 - soma
					return true if resultado2 == valor[13] # CNPJ valido
				end
			end
		end

		record.errors.add(attr_name, :documento, options.merge(:value => value))

	end
end

# This allows us to assign the validator in the model
module ActiveModel::Validations::HelperMethods
	def validates_documento(*attr_names)
		validates_with DocumentoValidator, _merge_attributes(attr_names)
	end
end