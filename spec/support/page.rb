class Page
  def method_missing(name, *args, &block)
    Page.current_context.__send__(name, *args, &block)
  end

  class << self
    attr_accessor :current_context
  end
end

RSpec.configure do |config|
  config.before do
    Page.current_context = self
  end
end
