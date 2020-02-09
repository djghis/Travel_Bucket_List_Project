require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/cities_controller')
require_relative('controllers/continents_controller')
require_relative('controllers/countries_controller')
require_relative('controllers/sights_controller')
require_relative('controllers/visits_controller')

get '/' do
  erb( :index )
end
