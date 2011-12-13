require 'bundler/gem_tasks'
task :test do
  ['sqlite', 'postgres', 'mysql'].each do |environment|
    puts "Running tests for environment #{environment}"
    ENV['ARC_ENV'] = environment
    system 'rspec spec'
  end
end

task :setup do
  #setup postgres
  `createdb arc_development -O jacob`
  puts "Setup complete"
end


namespace :test do
  task :adapter, :env do |task, args|
    ENV['ARC_ENV'] = args.env
    system 'rspec spec/data_stores/data_store_spec.rb spec/schemas/schema_spec.rb'
  end
  task :docs do
    `rspec spec -f h > doc/spec.html`
  end
end

#example use of passing arguments to rake
# task :say, :word, :person do |task, args|
#   puts task
#   puts '"args.word"'
#   puts "\t- #{args.person}"
# end
# $ rake say[hello,"Jacob Morris"]
# >>  say
# >>  "hello"
# >>    - Jacob Morris