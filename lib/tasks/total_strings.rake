# frozen_string_literal: true

namespace :test do
  desc 'Total strigs in ruby files'
  task :total_strings do
    count = 0
    Dir.glob("#{Rails.root}/**/*.rb").each do |file|
      next if File.directory? file

      count += File.readlines(file).size
    end
    puts "Total strings: #{count}"
  end
end
