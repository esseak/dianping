#encoding: utf-8

module DianPing
  module API
    DFT_CITY = '杭州'
    module Utils
      # 这里的GET请求对返回码以及返回类型的要求属于比较简单统一的
      # opts[:json]
      # opts['default_content_hash']，把顺利运行时得到的keys放进来，这样在出错的时候，外部代码对返回的结果进行处理时稍微更方便一点
      def get(url, params, opts={:json => true, 'default_content_hash' => {}})
        url = url + "?" + params.merge(:sign => gen_sign(params), :appkey => appkey).to_param
        logger.debug(url)
        resp = self.connection.get(url)
        logger.debug resp.inspect
        status = resp.status
        results = nil
        if status == 200
          if resp.headers["content-type"].index("json")
            hash = JSON.parse(resp.body) rescue {"error"=>{"errorCode"=>-1, "errorMessage"=>"parse response body to JSON error"}}.merge(opts['default_content_hash'])
            opts['default_content_hash'].keys.each {|k| hash[k] = opts['default_content_hash'][k] if !hash[k]}
            results = hash, resp
          elsif opts[:json]
            results = {"error"=>{"errorCode"=>-2, "errorMessage"=>"why I havn't get JSON response"}}.merge(opts['default_content_hash']), resp
          else
            results = {}.merge(opts['default_content_hash']), resp
          end
        else
          results = {"error"=>{"errorCode"=>-3, "errorMessage"=>"http request get a #{resp.status} response."}}.merge(opts['default_content_hash']), resp
        end
        # 统一log记录一下简单省事
        if results[0]["error"]
          logger.warn("#{url.split('/').last} error: #{results[0]["error"]["errorMessage"]}")
        end
        return results
      end
      def gen_sign(params)
        assert(params.is_a?(Hash))
        array = []
        params.keys.sort.each {|k| array << "#{k}#{params[k]}"}
        Digest::SHA1.hexdigest(appkey.to_s + array.join("") + secret).upcase
      end

      # The Faraday connection object
      def connection
        @connection ||= begin
          Faraday.new("http://api.dianping.com")
        end
      end
      def logger
        @logger ||= begin
          Rails.logger rescue Logger.new(STDOUT)
        end
      end
    end
  end
end

