module Pixmatch
  class Client
    module Search
      # Given an image, search against our collection and return any matches with corresponding scores.
      # @param image [File or String] The image file object that will be searched for.
      # @param options [Hash] The following options.
      #   * min_score [Integer] The minimum score that should be returned, defaults to 0. Should be between 0 and 100 (inclusive).
      #   * max_num_matches [Integer] The maximum number of matches that should be returned, defaults to 10. A value of -1 indicates no limit.
      #   * check_horizontal_flip [Boolean] Indicates whether the search incorporates checking for horizontal flips, defaults to true.
      # @return Array of { score, filename } hashes.
      def search(image, options = {})
        payload = { "image" => image.is_a?(File) ? image : File.new(image, "rb") }
        response = request(:post, 'rest', { method: 'search' }.merge(options), { payload: payload })
        result = response['result']
        raise "Missing result in response." if result.nil?
        raise "Invalid result in response (#{result.class.name})." if ! result.is_a?(Array)
        result
      end
    end    
  end
end
