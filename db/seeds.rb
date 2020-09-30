
require 'csv'
require 'faker'
require 'cpf_faker'

Variable.destroy_all
Base.destroy_all
User.destroy_all

manager1 = User.create!(email: "manager1@test.com", password: '123456', name: Faker::Name.name, cpf: Faker::CPF.numeric, manager: true )

base = Base.create!(name: "Banco de Dados de Síndrome Respiratória Aguda Grave", description: "Vigilância de Síndrome Respiratória Aguda Grave (SRAG) O Ministério da Saúde, por meio da Secretaria de Vigilância em Saúde (SVS), desenvolve a vigilância da Síndrome Respiratória Aguda...", legal_base: "Lei 1111/2019", technical_area: "Secretaria de Vigilancia Sanitária", user: manager1)

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
csv_text = "./lib/seeds/srag_hospitalizado.csv"

CSV.foreach(csv_text, csv_options) do |row|
  variable = Variable.create!(name: row[0], description: row[1], category: row[2], sensibility: row[3], base: base)
end

manager2 = User.create!(email: "manager2@test.com", password: '123456', name: Faker::Name.name, cpf: Faker::CPF.numeric, manager: true )

base = Base.create!(name: "Unidades Básicas de Saúde - UBS", description: "As Unidades Básicas de Saúde (UBS) são a porta de entrada preferencial do Sistema Único de Saúde (SUS). O objetivo desses postos é atender até 80% dos problemas de saúde da população, sem que haja a necessidade de encaminhamento para hospitais.", legal_base: "Lei 1111/2019", technical_area: "Secretaria de Atenção Básica", user: manager2)

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
csv_text = "./lib/seeds/ubs.csv"

CSV.foreach(csv_text, csv_options) do |row|
  variable = Variable.create!(name: row[0], description: row[1], category: row[2], sensibility: row[3], base: base)
end

10.times do |i|
  user = User.create!(email: "user#{i}@test.com", password: '123456', name: Faker::Name.name, cpf: Faker::CPF.numeric )
end


puts "Número de variáveis criadas: #{Variable.count}"
puts "Número de bases criadas: #{Base.count}"
puts "Número de usuários criados: #{User.count}"





# Seed Gabi e Fabi - FAVOR NÃO APAGAR!
# require 'faker'

# puts 'Cleaning DB'
# Variable.destroy_all
# Base.destroy_all
# User.destroy_all
# puts 'DB cleaned'

# puts 'Creating users'

# 10.times do |i|
#   user = User.create!(email: "test#{i}@test.com", password: '123123', cpf: '000', manager: true )
#   puts 'Creating bases'
#   2.times do
#     base = Base.create!(name: Faker::Name.name, description: Faker::Quote.famous_last_words, 
#     legal_base: 'Execução de Políticas Públicas', technical_area: 'Secretaria de Atenção à Saúde',
#     user_id: user.id)
    
#     puts 'Creating variables'
#     20.times do
#       variable = Variable.create!(name: Faker::Food.fruits, description: Faker::Food.description, 
#       category: 'cadastral', sensibility: 'sensível', base_id: base.id) 
#     end
#   end
# end

# puts 'Parabéns!'