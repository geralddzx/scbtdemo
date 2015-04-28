module Phone
  extend ActiveSupport::Concern

  def validate_phone
    phone = self.phone
    return if phone.nil? || phone.empty?
    unless phone.length == 10 && phone.to_i.to_s == phone
      errors.add(:phone, "number is not valid") 
    end
  end

end
