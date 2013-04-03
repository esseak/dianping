#encoding: utf-8

module DianPing
  module API
  end
end

tobe_loaded = [
  File.expand_path("../dianping/api/utils.rb", __FILE__),
  File.expand_path("../dianping/api/business.rb", __FILE__),
  File.expand_path("../dianping/api/deal.rb", __FILE__),
  File.expand_path("../dianping/api/coupon.rb", __FILE__),
  File.expand_path("../dianping/api/metadata.rb", __FILE__),
  File.expand_path("../dianping/api/review.rb", __FILE__),
  File.expand_path("../dianping/client.rb", __FILE__),
]
if Rails.env == "production"
  tobe_loaded.each {|f| require f}
else
  tobe_loaded.each {|f| load f}
end
