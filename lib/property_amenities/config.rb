require 'rails_config_loader'

module MainApp
  def self.config
    Config.instance
  end

  class Config
    include Singleton
    include ::ConfigLoader::Delegator

    def amenities
      @amenities ||= load_hash 'amenities.yml'
    end
  end
end
