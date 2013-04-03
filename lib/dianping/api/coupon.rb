#encoding: utf-8
module DianPing
  module API
    module Coupon
      include DianPing::API::Utils

      # 搜索优惠券
      def find_coupons(params={'city' => DianPing::API::DFT_CITY})
        path = "/v1/coupon/find_coupons"
        hash, resp = get(path, params, {'default_content_hash' => {'coupons' => [], 'count' => 0, 'total_count' => 0}})
        return hash
      end

      # 获取指定优惠券信息
      def get_single_coupon(params={})
        path = "/v1/coupon/get_single_coupon"
        assert(params['coupon_id'] && params['coupon_id'].is_a?(Fixnum))
        hash, resp = get(path, params, {'default_content_hash' => {'coupons' => [], 'count' => 0}})
        return hash
      end
    end
  end
end

