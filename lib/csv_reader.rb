require 'csv'

class CsvReader
  attr_reader :data

  def load_csv(file)
    CSV.open(file, headers: true, header_conveters: :symbol)
  end
end
