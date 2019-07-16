require './config/environment'

use Rack::MethodOverride
use UserController
use DiaryController
run ApplicationController
