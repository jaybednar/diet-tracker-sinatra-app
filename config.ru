require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use DietsController
use MealsController
use FoodsController
use UsersController
run ApplicationController