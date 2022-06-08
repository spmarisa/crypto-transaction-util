class TransactionsProcessingService

  def self.get_raw_transactions_data(block_hash, tx_count)
    raw_transactions = []

    (0..tx_count).step(25) do |offset|
      puts "Adding transaction after #{offset}"
      raw_transactions << BlockStreamClient.get_block_transactions(block_hash, offset)
    end

    raw_transactions.flatten!(1)
    return raw_transactions
  end

  # {"txid": "xxxxx", "vin": [add1, add2], "vout": [add7, add9]}
  def self.process_raw_transactions(raw_transactions)
    transactions = []

    raw_transactions.each do |txn|
      begin
        tmp = {}
        tmp["txid"] = txn["txid"]
        tmp["vin"] = txn["vin"].collect {|x| x["prevout"]["scriptpubkey_address"]}
        tmp["vout"] = txn["vout"].collect {|x| x["scriptpubkey_address"]}

        transactions << tmp
      rescue
        puts "Processing failed for raw transaction of id #{txn["txid"]}"
      end
    end

    return transactions
  end



end
