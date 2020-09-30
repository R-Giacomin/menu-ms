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




puts "Número de variáveis criadas: #{Variable.count}"
puts "Número de bases criadas: #{Base.count}"
puts "Número de usuários criados: #{User.count}"

