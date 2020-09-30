# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning DB'
Variable.destroy_all
Base.destroy_all
User.destroy_all
puts 'DB cleaned'

puts 'Creating users'

10.times do |i|
  user = User.create!(email: "test#{i}@test.com", password: '123123', cpf: '000', manager: true )
  puts 'Creating bases'
  2.times do
    base = Base.create!(name: Faker::Name.name, description: Faker::Quote.famous_last_words, 
    legal_base: 'Execução de Políticas Públicas', technical_area: 'Secretaria de Atenção à Saúde',
    user_id: user.id)
    
    puts 'Creating variables'
    20.times do
      variable = Variable.create!(name: Faker::Food.fruits, description: Faker::Food.description, 
      category: 'cadastral', sensibility: 'sensível', base_id: base.id) 
    end
  end
end

puts 'Parabéns!'
