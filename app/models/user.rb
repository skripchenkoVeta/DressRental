# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :profileable, polymorphic: true
end
