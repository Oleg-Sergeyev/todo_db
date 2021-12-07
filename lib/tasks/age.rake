# frozen_string_literal: true

namespace :test do
  desc 'Your age. Input birthdate [xx/xx/xxxx]'
  task :age, [:birthdate] do |_t, args|
    # regex = /\d{2}\/\d{2}\/\d{4}/
    # print "Enter your birthday 'dd/mm/yyyy': "
    # birthday = gets.chomp
    # raise 'Input is not date' unless birthday =~ regex

    bod = DateTime.parse(args[:birthdate])
    # raise 'Date is not correct' unless Date.valid_date?(bod.year, bod.month, bod.day)

    age = Date.today.year - bod.year
    age -= 1 if Date.today < bod + age.years
    puts "You are #{age}"
  end
end
