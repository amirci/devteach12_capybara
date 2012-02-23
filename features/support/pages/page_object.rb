module PageObject
  def initialize(session = nil)
    @session = session || Capybara.current_session
  end
  
  def method_missing(sym, *args, &block)
    @session.send sym, *args, &block
  end
end