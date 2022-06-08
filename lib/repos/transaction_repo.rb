class TransactionRepo
  require 'json'

  def self.save(block_hash, transactions_array)
    File.write("./db/#{block_hash}.json",transactions_array.to_json)
  end

  def self.find(block_hash)
    return nil unless File.exists? "./db/#{block_hash}.json"

    file = File.open "#{block_hash}.json"
    data = JSON.load file
    file.close

    return data
  end
end
