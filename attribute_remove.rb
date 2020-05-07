module Config
  class << self
    def configure!(attrs = {})
      attrs.each do |name, value|
        name = name.to_s.to_sym
        # protect against multiple executions
        singleton_class.instance_eval { attr_accessor name } unless self.class.method_defined?(name)
        send("#{name}=", value)
      end
    end
  end
end

Config.respond_to? :verbose
Config.configure! verbose: true
Config.respond_to? :verbose
puts Config.verbose
