require 'fakeweb'

FakeWeb.allow_net_connect = false

def faked_response(params)
  file = File.expand_path("./fakeweb/#{params}.xml",  File.dirname(__FILE__))
  File.read(file)
end

uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=&sDsSenha=&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=n&nVlValorDeclarado=0&sCdAvisoRecebimento=n&nCdServico=40010&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-n-valor_declarado-0-aviso_recebimento-n-servico-40010-diametro-0')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=&sDsSenha=&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=n&nVlValorDeclarado=0&sCdAvisoRecebimento=s&nCdServico=41106&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-n-valor_declarado-0-aviso_recebimento-s-servico-41106-diametro-0')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=N&sCdAvisoRecebimento=N&nVlValorDeclarado=0,00&nCdServico=40010&nCdEmpresa=&sDsSenha=&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-Diametro-0p0-formato-1-mao_propria-N-aviso_recebimento-N-valor_declarado-0p00-servico-40010')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=&sDsSenha=&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=n&nVlValorDeclarado=2000,00&sCdAvisoRecebimento=n&nCdServico=40010&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-n-valor_declarado-2000p00-aviso_recebimento-n-servico-40010-diametro-0')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=N&sCdAvisoRecebimento=N&nVlValorDeclarado=2000,00&nCdServico=40010&nCdEmpresa=&sDsSenha=&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-N-aviso_recebimento-N-valor_declarado-2000p00-servico-40010')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=&sDsSenha=&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=s&nVlValorDeclarado=0&sCdAvisoRecebimento=n&nCdServico=40010&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-s-valor_declarado-0-aviso_recebimento-n-servico-40010-Diametro-0')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=S&sCdAvisoRecebimento=N&nVlValorDeclarado=0,00&nCdServico=40010&nCdEmpresa=&sDsSenha=&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-S-aviso_recebimento-N-valor_declarado-0p00-servico-40010')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=&sDsSenha=&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=n&nVlValorDeclarado=0&sCdAvisoRecebimento=s&nCdServico=40010&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-n-valor_declarado-0-aviso_recebimento-s-servico-40010-diametro-0')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=N&sCdAvisoRecebimento=S&nVlValorDeclarado=0,00&nCdServico=40010&nCdEmpresa=&sDsSenha=&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-N-aviso_recebimento-S-valor_declarado-0p00-servico-40010')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=N&sCdAvisoRecebimento=S&nVlValorDeclarado=0,00&nCdServico=41106&nCdEmpresa=&sDsSenha=&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-N-aviso_recebimento-S-valor_declarado-0p00-servico-41106')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=&sDsSenha=&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=s&nVlValorDeclarado=0&sCdAvisoRecebimento=n&nCdServico=41106&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-s-valor_declarado-0-aviso_recebimento-n-servico-41106-diametro-0')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=S&sCdAvisoRecebimento=N&nVlValorDeclarado=0,00&nCdServico=41106&nCdEmpresa=&sDsSenha=&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-S-aviso_recebimento-N-valor_declarado-0p00-servico-41106')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=&sDsSenha=&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=n&nVlValorDeclarado=2000,00&sCdAvisoRecebimento=n&nCdServico=41106&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-n-valor_declarado-2000p00-aviso_recebimento-n-servico-41106-diametro-0')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=N&sCdAvisoRecebimento=N&nVlValorDeclarado=2000,00&nCdServico=41106&nCdEmpresa=&sDsSenha=&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-N-aviso_recebimento-N-valor_declarado-2000p00-servico-41106')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=&sDsSenha=&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=n&nVlValorDeclarado=0&sCdAvisoRecebimento=n&nCdServico=41106&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-n-valor_declarado-0-aviso_recebimento-n-servico-41106-diametro-0')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=N&sCdAvisoRecebimento=N&nVlValorDeclarado=0,00&nCdServico=41106&nCdEmpresa=&sDsSenha=&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-N-aviso_recebimento-N-valor_declarado-0p00-servico-41106')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=faketoken&sDsSenha=fakepass&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=n&nVlValorDeclarado=0&sCdAvisoRecebimento=s&nCdServico=81019&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-n-valor_declarado-0-aviso_recebimento-s-servico-81019-diametro-0-empresa-faketoken-senha-fakepass')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=N&sCdAvisoRecebimento=S&nVlValorDeclarado=0,00&nCdServico=81019&nCdEmpresa=faketoken&sDsSenha=fakepass&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-n-aviso_recebimento-s-valor_declarado-0p00-servico-81019-empresa-faketoken-senha-fakepass')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=faketoken&sDsSenha=fakepass&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=s&nVlValorDeclarado=0&sCdAvisoRecebimento=n&nCdServico=81019&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-s-valor_declarado-0-aviso_recebimento-n-servico-81019-diametro-0-empresa-faketoken-senha-fakepass')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=S&sCdAvisoRecebimento=N&nVlValorDeclarado=0,00&nCdServico=81019&nCdEmpresa=faketoken&sDsSenha=fakepass&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-s-aviso_recebimento-n-valor_declarado-0p00-servico-81019-empresa-faketoken-senha-fakepass')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')

uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=faketoken&sDsSenha=fakepass&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=n&nVlValorDeclarado=2000,00&sCdAvisoRecebimento=n&nCdServico=81019&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-n-valor_declarado-2000p00-aviso_recebimento-n-servico-81019-diametro-0-servico-81019-empresa-faketoken-senha-fakepass')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=N&sCdAvisoRecebimento=N&nVlValorDeclarado=2000,00&nCdServico=81019&nCdEmpresa=faketoken&sDsSenha=fakepass&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-n-aviso_recebimento-n-valor_declarado-2000p00-servico-81019-empresa-faketoken-senha-fakepass')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=faketoken&sDsSenha=fakepass&sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=5&nVlLargura=15&sCdMaoPropria=n&nVlValorDeclarado=0&sCdAvisoRecebimento=n&nCdServico=81019&nVlDiametro=0&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1-formato-1-comprimento-20-altura-5-largura-15-mao_propria-n-valor_declarado-0-aviso_recebimento-n-diametro-0-servico-81019-empresa-faketoken-senha-fakepass')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')


uri  = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?sCepOrigem=71939360&sCepDestino=72151613&nVlPeso=1.0&nVlComprimento=20,0&nVlLargura=15,0&nVlAltura=5,0&nVlDiametro=0,0&nCdFormato=1&sCdMaoPropria=N&sCdAvisoRecebimento=N&nVlValorDeclarado=0,00&nCdServico=81019&nCdEmpresa=faketoken&sDsSenha=fakepass&StrRetorno=xml'
body = faked_response('origem-71939360-destino-72151613-peso-1.0-comprimento-20p0-largura-15p0-altura-5p0-diametro-0p0-formato-1-mao_propria-n-aviso_recebimento-n-valor_declarado-0p00-servico-81019-empresa-faketoken-senha-fakepass')
FakeWeb.register_uri(:get, uri, :body => body, :content_type => 'text/xml')
