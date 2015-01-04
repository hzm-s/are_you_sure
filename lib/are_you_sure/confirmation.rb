require 'delegate'

module AreYouSure
  class Confirmation < SimpleDelegator
    include Confirmable

    attr_reader :session_store, :confirmed

    def initialize(model, session_store, confirmed = nil)
      super(model)
      @session_store = session_store
      @confirmed = confirmed
    end

    def fill_confirmed_attributes
      return unless session_store[:model_attributes]
      self.attributes = session_store[:model_attributes]
      clear_attributes_cache
    end

    def clear_attributes_cache
      session_store[:model_attributes] = nil
    end

    def class
      __getobj__.class
    end
  end
end
