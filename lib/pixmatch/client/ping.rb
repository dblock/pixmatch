module Pixmatch
  class Client
    module Ping
      def ping
        method('ping')
      end
    end    
  end
end
