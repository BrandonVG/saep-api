class AccessToken
  class << self
    def encode(payload)
      exp = 8.hours.from_now
      payload[:exp] = exp.to_i
      key = Rails.application.secret_key_base
      JWT.encode(payload, key)
    end

    def decode(token)
      key = Rails.application.secret_key_base
      begin
        JWT.decode(token, key)
      rescue JWT::ExpiredSignature
        'Token expirado'
      end
    end

    def get_user_from_token(token)
      response = decode(token)
      if response == 'Token expirado'
        nil
        return
      end
      payload = response[0]
      user_id = payload['user_id']
      User.find_by(id: user_id)
    end
  end
end
