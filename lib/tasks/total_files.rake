# frozen_string_literal: true

namespace :test do
  desc 'Total files in this project'
  task :total_files do
    puts "Total files: #{Dir.glob("#{Rails.root}/**/*.*").size}"
  end
end
