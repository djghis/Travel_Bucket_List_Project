require_relative('../db/sql_runner')

class Country

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @continent_id = options['continent_id']
  end

  def save()
  sql = "INSERT INTO countries
  (
    name,
    continent_id
    ) VALUES (
      $1, $2
      )
      RETURNING id"
      values = [@name, @continent_id]
    country = SqlRunner.run(sql, values).first
    @id = country['id'].to_i
  end

  def continent()
    sql = "SELECT * FROM continents WHERE id = $1"
    values = [@continent_id]
    results = SqlRunner.run(sql, values)
    country_continent = results[0]
    continent = Continent.new(country_continent)
    return continent
  end

  def self.all()
    sql = "SELECT * FROM countries"
    countries = SqlRunner.run(sql)
    result = countries.map{ |country| Country.new(country)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM countries;"
    SqlRunner.run(sql)
  end

end
