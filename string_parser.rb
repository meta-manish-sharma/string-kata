class StringParser
	DEFAULT_DELIMITER = /,|\n/

	def self.parse(string)
		return [DEFAULT_DELIMITER, string] unless string.start_with?("//")

		header, numbers = string.split("\n", 2)
    delimiters = extract_delimiters(header)
    [Regexp.union(delimiters), numbers]
	end

	def self.extract_delimiters(header)
    if header.include?("[")
      header.scan(/\[(.*?)\]/).flatten
    else
      [header[2]]
    end
  end
end