module AttrSanitizer

  def self.included( base )
    puts "AttrSanitizer included in #{base}"
    base.extend ClassMethods
    base.inheritable_attributes[:attr_sanitized] = []
  end

  def sanitize_attributes
    self.class.inheritable_attributes[:attr_sanitized].each do |attr|
      self.send("#{attr}=", Sanitize.clean(self.send(attr)) )
    end
    self
  end

  module ClassMethods
    def attr_sanitizer( field )
      self.inheritable_attributes[:attr_sanitized] << field
    end
  end

end
