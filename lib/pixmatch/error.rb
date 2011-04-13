module Pixmatch
  # Custom error class for rescuing from all known Pixmatch errors.
  class Error < StandardError
    attr_accessor :status, :method, :detail 
    
    def initialize(json)
      @status = json['status']
      @method = json['method']
      @error = json['error']
      @result = json['result']
    end
    
    def to_s
      s = @error.nil? ? 'Unexpected Error' : @error.join('\r\n')
      s += ("\r\n " + @result.join('\r\n ')) if @result
    end
  end
end
