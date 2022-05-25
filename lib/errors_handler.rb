class ErrorsHandler
  class << self
    def hand_errors(errors)
      data = errors.as_json
      response = []
      data.each do |key, value|
        value.each do |m|
          response.push("#{key} error: #{m}")
        end
      end
      response
    end
  end

end
