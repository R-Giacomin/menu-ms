require 'csv'
require 'faker'
require 'cpf_faker'
require_relative 'seed_aux.rb'

Variable.destroy_all
Base.destroy_all
User.destroy_all

admin = User.create!(email: "admin@admin.com", password: '123456', name: Faker::Name.name, cpf: Faker::CPF.numeric, admin: true )

manager1 = User.create!(email: "manager1@test.com", password: '123456', name: Faker::Name.name, cpf: Faker::CPF.numeric, manager: true )

base = Base.create!(name: "Banco de Dados de Síndrome Respiratória Aguda Grave", description: "Vigilância de Síndrome Respiratória Aguda Grave (SRAG) O Ministério da Saúde, por meio da Secretaria de Vigilância em Saúde (SVS), desenvolve a vigilância da Síndrome Respiratória Aguda...", legal_base: "Cumprimento das obrigações legais ou regulatórias, Execução de políticas públicas, Proteção da vida, Tutela da saúde, Condução de estudos e pesquisas", technical_area: "Secretaria de Vigilancia Sanitária", user: manager1)

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
csv_text = "./lib/seeds/srag_hospitalizado.csv"

CSV.foreach(csv_text, csv_options) do |row|
  variable = Variable.create!(name: row[0], description: row[1], category: row[2], base: base)
end

base = Base.create!(name: "Base Nacional do Conjunto Mínimo de Dados", description: "É o serviço de recepção dos contatos assistenciais (atendimentos) que será disponibilizado para qualquer usuário autorizado a efetuar envios, seja no CMD - Coleta Simplificada ou outro aplicativo a ser integrado.", legal_base: "Cumprimento das obrigações legais ou regulatórias, Execução de políticas públicas, Proteção da vida, Tutela da saúde, Condução de estudos e pesquisas", technical_area: "Secretaria de Atenção Especializada à Saúde", user: manager1)

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
csv_text = "./lib/seeds/cmd.csv"

CSV.foreach(csv_text, csv_options) do |row|
  variable = Variable.create!(name: row[0], description: row[1], category: row[2], base: base)
end

manager2 = User.create!(email: "manager2@test.com", password: '123456', name: Faker::Name.name, cpf: Faker::CPF.numeric, manager: true )

base = Base.create!(name: "E-SUS Notifica", description: "registro de notificações de casos suspeitos do Novo Coronavírus – COVID-19.", legal_base: "Cumprimento das obrigações legais ou regulatórias, Execução de políticas públicas, Proteção da vida, Tutela da saúde, Condução de estudos e pesquisas", technical_area: "Secretaria de Vigilância em Saúde", user: manager2)

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
csv_text = "./lib/seeds/esus_notifica_covid.csv"

CSV.foreach(csv_text, csv_options) do |row|
  variable = Variable.create!(name: row[0], description: row[1], category: row[2], sensibility: row[3], base: base)
end

base = Base.create!(name: "Base Nacional de Vigilância de Violências e Acidentes (Viva)", description: "O objetivo do Viva é conhecer a magnitude e a gravidade das violências e acidentes e fornecer subsídios para definição de políticas públicas, estratégias e ações de intervenção, prevenção, atenção e proteção às pessoas em situação de violência.", legal_base: "Cumprimento das obrigações legais ou regulatórias, Execução de políticas públicas, Proteção da vida, Tutela da saúde, Condução de estudos e pesquisas", technical_area: "Secretaria de Vigilância em Saúde", user: manager2)

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
csv_text = "./lib/seeds/esus_notifica_covid.csv"

CSV.foreach(csv_text, csv_options) do |row|
  variable = Variable.create!(name: row[0], description: row[1], category: row[2], sensibility: row[3], base: base)
end

10.times do |i|
  user = User.create!(email: "user#{i}@test.com", password: '123456', name: Faker::Name.name, cpf: Faker::CPF.numeric )
end

# puts "Alimentando o banco com pedidos..."
# User.all.each do |usr|
#   feed_order(usr)
# end

# puts "Alimentando os pedidos com itens..."
# feed_item

puts "Número de variáveis criadas: #{Variable.count}"
puts "Número de bases criadas: #{Base.count}"
puts "Número de usuários criados: #{User.count}"
puts "Número de Pedidos criados: #{Order.count}"
puts "Número de Itens criados: #{Item.count}"





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
