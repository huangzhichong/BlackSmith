require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :host  => 'localhost',
  :adapter => 'mysql2',
  :database   => 'hunter',
  :username => 'root',
:password  => '')

class Page < ActiveRecord::Base
  belongs_to :market
  set_table_name 'Page'
end
class Market < ActiveRecord::Base
  has_many :pages
  set_table_name 'market'
end