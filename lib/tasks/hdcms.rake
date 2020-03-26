namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app swt-poc-test --confirm swt-poc-test
      heroku run rake db:migrate --app swt-poc-test
      heroku run rake db:seed --app swt-poc-test')	
  end
end