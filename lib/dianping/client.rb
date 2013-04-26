#encoding: utf-8

module DianPing
  class Client
    attr_reader :appkey, :appsecret
    alias :secret :appsecret
    include DianPing::API::Business
    include DianPing::API::Deal
    include DianPing::API::Coupon
    include DianPing::API::Review
    include DianPing::API::Metadata
    def initialize(options={})
      @cfg = options[:cfg_file] || options["cfg_file"]
      if File.exists? File.expand_path("../cfg.yml", __FILE__)
        @cfg = File.expand_path("../cfg.yml", __FILE__)
      end
      @cfg_hash = YAML.load_file(@cfg)
      options = {
        :app_key =>  @cfg_hash["dianping"]["appkey"],
        :app_secret => @cfg_hash["dianping"]["appsecret"]
      }.merge(options)
      @appkey = options[:app_key]
      @appsecret = options[:app_secret]
    end
  end
end
=begin
client = DianPing::Client.new
client.find_businesses({})
=end
