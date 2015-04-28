module Datetime
  extend ActiveSupport::Concern

  included do
    # make_searchable :title, :body
  end

  def display_datetime
    return self.updated_at if self.datetime.nil?
    self.datetime.strftime('%FT%X')
  end

  module ClassMethods
    # def search
    # end
  end
end

