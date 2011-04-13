module Pixmatch
  class Client
    module Delete
      # Given a list of image filenames, delete the images from the collection.
      # @param files [Array] Array of file names.
      def delete(filenames) 
        filenames = [ filenames ] if filenames.is_a?(String)
        filenames_hash = { }
        filenames.each { |f| filenames_hash["filenames[#{filenames_hash.size}]"] = f }
        request(:post, 'rest', { method: :delete }, { payload: filenames_hash })
      end
    end    
  end
end
