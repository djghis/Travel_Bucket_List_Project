require_relative('../db/sql_runner')

class City

  attr_reader :id
  attr_accessor :name, :country_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @country_id = options['country_id']
  end

  def save()
  sql = "INSERT INTO cities
  (
    name,
    country_id
    ) VALUES (
      $1, $2
      )
      RETURNING id"
      values = [@name, @country_id]
  city = SqlRunner.run(sql, values).first
  @id = city['id'].to_i
end

def self.delete_all()
      sql = "DELETE FROM cities;"
      SqlRunner.run(sql)
  end

end