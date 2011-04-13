module Pixmatch
  class Client
    module Count
      # Get the number of items currently in the collection.
      def count
        response = request(:get, 'rest', { method: :count })
        result = response['result']
        raise "Missing result in response." if result.nil?
        raise "Invalid result in response (#{result.class.name})." if ! result.is_a?(Array)
        raise "Invalid count in result response (#{result.size})." if result.size != 1
        result[0].to_i
      end
    end    
  end
end
