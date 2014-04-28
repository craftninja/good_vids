require_relative 'good_vids'
require 'sequel'
DB = Sequel.connect('postgres://gschool_user:password@localhost/good_vids_development')
run GoodVids
