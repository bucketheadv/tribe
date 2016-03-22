namespace :admin do 
  desc 'create admin user'
  task create: :environment do 
    if ENV['email'] && ENV['password']
      User.create(email: ENV['email'], password: ENV['password'])
    end
  end
end
