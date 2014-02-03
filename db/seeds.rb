# encoding: utf-8

# ActionMailer::Base.default_url_options = { :host => 'localhost:3000' }

Usuario.create(:nome => 'Corebit', :email => 'contato@corebit.com.br', :password => 'testes', :password_confirmation => 'testes', :roles => [Usuario::ADMIN] )
Usuario.create(:nome => 'Thadeu Brito', :email => 'thadeu@corebit.com.br', :password => 'testes', :password_confirmation => 'testes')
