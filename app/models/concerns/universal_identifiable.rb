module UniversalIdentifiable
  extend ActiveSupport::Concern

  included do
    before_create :generate_uuid

    def to_param
      uuid
    end
  end

  private

  def generate_uuid
    loop do
      self.uuid = SecureRandom.uuid
      break unless self.class.exists?("uuid" => uuid)
    end
  end
end
