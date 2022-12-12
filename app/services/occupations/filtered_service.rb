# frozen_string_literal: true

# Filtered occupations
class Occupations::FilteredService
  attr_reader :occupations

  def initialize(occupations)
    @occupations = occupations
  end

  def call(params)
    filtered_occupations = occupations

    filtered_occupations = by_place_id(filtered_occupations, params)
    filtered_occupations = by_field_of_activity_id(filtered_occupations, params)
    filtered_occupations
  end

  protected

  def by_place_id(filtered_occupations, params)
    return filtered_occupations unless params[:place_id].present?

    filtered_occupations.where(place_id: params[:place_id])
  end

  def by_field_of_activity_id(filtered_occupations, params)
    return filtered_occupations unless params[:field_of_activity_id].present?

    filtered_occupations.where(
      field_of_activity_id: params[:field_of_activity_id]
    )
  end
end
