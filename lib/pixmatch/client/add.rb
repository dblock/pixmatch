module Pixmatch
  class Client
    module Add
      # Index and Add a list of images to your collection.
      # @param files [Array] Array of File or String objects.
      def add(files)
        file_hash = { }
        files.each { |f| file_hash["images[#{file_hash.size}]"] = f.is_a?(File) ? f : File.new(f, "rb") }
        request(:post, 'rest', { method: :add }, { payload: file_hash })        
      end
    end    
  end
end
