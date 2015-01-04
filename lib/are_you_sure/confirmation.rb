require 'delegate'

module AreYouSure
  class Confirmation < SimpleDelegator
    include Confirmable

    def initialize(model)
      super(model)
    end

    def class
      __getobj__.class
    end
  end
end
