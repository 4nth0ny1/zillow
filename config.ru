require './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use StaticPagesController
use ShowingsController
use SessionsController
use UsersController
use ListingsController
run ApplicationController
