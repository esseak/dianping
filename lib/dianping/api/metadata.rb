#encoding: utf-8
module DianPing
  module API
    module Metadata
      include DianPing::API::Utils

      # 获取支持商户搜索的最新城市列表
      def get_cities_with_businesses
        path = "/v1/metadata/get_cities_with_businesses"
        hash, resp = get(path, params, {'default_content_hash' => {'cities' => []}})
        return hash
      end

      # TODO more...
    end
  end
end

