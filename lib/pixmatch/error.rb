module Pixmatch
  # Custom error class for rescuing from all known Pixmatch errors.
  class Error < StandardError
    attr_accessor :status, :method, :detail 
    
    def initialize(json)
      @status = json['status']
      @method = json['method']
      @error = json['error']
    end
    
    def to_s
      @error.nil? ? 'undefined' : @error.join('\r\n')
    end
  end
end
