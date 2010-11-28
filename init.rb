require 'sanitize'

class ActiveRecord::Base
  include AttrSanitizer
  before_save :sanitize_attributes
end
