# .simplecov
require 'simplecov'
SimpleCov.start 'rails' do
  # any custom configs like groups and filters can be here at a central place
  add_filter "/test/"
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/lib/'
  add_filter '/vendor/'
 
  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Views', 'app/views'

end