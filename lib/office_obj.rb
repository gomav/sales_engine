class OfficeObj
  attr_reader :id, :created_at, :updated_at

  def initialize(data)
    @id = data[:id]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end
end
