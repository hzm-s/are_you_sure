module AreYouSure
  class AttributesCache
    KEY = :are_you_sure_model_attributes

    def initialize(cache)
      @cache = cache
    end

    def store(attributes)
      @cache[KEY] = attributes
    end

    def stored?
      @cache.has_key?(KEY)
    end

    def retrieve
      @cache.delete(KEY)
    end
  end
end
