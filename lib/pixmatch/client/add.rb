module Pixmatch
  class Client
    module Add
      # Index and Add a list of images to your collection.
      # @param files [Array] Array of File or String objects.
      def add(files)
        files = [ files ] if (files.is_a?(String) || files.is_a?(File))
        files_hash = { }
        files.each { |f| files_hash["images[#{files_hash.size}]"] = f.is_a?(File) ? f : File.new(f, "rb") }
        request(:post, 'rest', { method: :add }, { payload: files_hash })        
      end
    end    
  end
end
