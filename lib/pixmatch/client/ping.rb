module Pixmatch
  class Client
    module Ping
      # Check whether the PixMatch server is running.
      def ping
        request(:get, 'rest', { method: :ping })
      end
    end    
  end
end
