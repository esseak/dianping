#encoding: utf-8
module DianPing
  module API
    module Deal
      include DianPing::API::Utils

      # 搜索团购
      def find_deals(params={'city' => DianPing::API::DFT_CITY})
        path = "/v1/deal/find_deals"
        hash, resp = get(path, params, {'default_content_hash' => {'deals' => [], 'count' => 0, 'total_count' => 0}})
        return hash
      end

      # 获取指定团购信息
      def get_single_deal(params={})
        path = "/v1/deal/get_single_deal"
        assert(params['deal_id'] && params['deal_id'].is_a?(Fixnum))
        hash, resp = get(path, params, {'default_content_hash' => {'deals' => [], 'count' => 0}})
        return hash
      end
    end
  end
end
