module ChargeBee
  class Request    

    def self.send(method, url, params = {}, env)
      env ||= ChargeBee.default_env
      ser_params = Util.serialize(params)
      resp = Rest.request(method, url, env, ser_params||={})
      resp.has_key?(:list) ? ListResult.new(resp[:list]) : Result.new(resp)
    end
      
  end
end