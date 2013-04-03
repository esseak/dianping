#encoding: utf-8
module DianPing
  module API
    module Business
      include DianPing::API::Utils
      # 搜索商户
      def find_businesses(params={'city' => DianPing::API::DFT_CITY})
        assert(params.is_a?(Hash))
        #assert(params['city'] || (params['longitude'] && params['latitude']), '请求参数组合无效: city与longitude/latitude至少选其一')
        path = "/v1/business/find_businesses"
        hash, resp = get(path, params, {'default_content_hash' => {'businesses' => [], 'count' => 0}})
        return hash
      end

      # 获取指定商户信息
      def get_single_business(params={})
        assert(params['business_id'] && params['business_id'].is_a?(Fixnum))
        path = "/v1/business/get_single_business"
        hash, resp = get(path, params)
        return hash
      end

      # 获取商户月热搜词
      def get_monthly_trends(params={'city' => DianPing::API::DFT_CITY})
        assert(params['category'])
        path = "/v1/business/get_monthly_trends"
        hash, resp = get(path, params, {'default_content_hash' => {'trends' => [], 'count' => 0}})
        return hash
      end
    end
  end
end
