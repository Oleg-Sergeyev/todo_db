# frozen_string_literal: true

namespace :test do
  desc 'Current time'
  task :currtime do
    file = "#{Rails.root}/tmp/development.txt"
    File.write(file, DateTime.now, nil, mode: 'w')
    puts "File writed #{file}"
    puts File.open(file).read
  end
end
