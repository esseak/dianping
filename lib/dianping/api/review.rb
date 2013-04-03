#encoding: utf-8
module DianPing
  module API
    module Review
      include DianPing::API::Utils

      # 获取指定商户最新点评片断
      def get_recent_reviews(params={})
        assert(params['business_id'] && params['business_id'].is_a?(Fixnum))
        path = "/v1/review/get_recent_reviews"
        hash, resp = get(path, params, {'default_content_hash' => {'reviews' => [], 'count' => 0}})
        return hash
      end
    end
  end
end

