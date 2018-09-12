# frozen_string_literal: true

require 'active_model'

class CoordinateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.is_a?(Integer)
      record.errors.add(attribute, :not_a_number)
      record.errors.add(attribute, :not_an_integer)
      return
    end
    record.errors.add(attribute, :greater_than, count: 0) unless value.positive?
    return if value <= max_value(record)

    record.errors.add(attribute, 'is bigger than bitmap')
  end

  def max_value(record)
    axis = options.fetch(:axis, :size)
    record.public_send("max_#{axis}")
  end
end

class ColorValidator < ActiveModel::EachValidator
  COLOR_REGEX = /\A[A-Z]\Z/

  def validate_each(record, attribute, value)
    record.errors[attribute] << 'not a valid color' unless value =~ COLOR_REGEX
  end
end
