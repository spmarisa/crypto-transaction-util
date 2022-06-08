class TransactionRepo
  require 'json'

  def self.save(file_name, data)
    File.write("./db/#{file_name}.json",data.to_json)
  end

  def self.find(file_name)
    return nil unless File.exists? "./db/#{file_name}.json"

    file = File.open "./db/#{file_name}.json"
    data = JSON.load file
    file.close

    return data
  end
end
