class Block
  require_relative 'clients/block_stream_client'
  require_relative 'repos/transaction_repo'
  require_relative 'services/transactions_processing_service'

  attr_accessor :id, :hash, :block_height, :tx_count, :transactions, :raw_transactions

  # created new object with required fields
  def initialize(block_height)
    @block_height = block_height
    @hash ||= BlockStreamClient.get_hash(@block_height)
    @tx_count ||= BlockStreamClient.get_block_info(@hash)["tx_count"]
    @transactions, @raw_transactions = [], []
  end

  # populates data either from local db or external client
  def populate_raw_transactions()
    raw_transactions_resultset = TransactionRepo.find("raw" + @hash)

    if raw_transactions_resultset
        puts "Loading data from DB."
      @raw_transactions = raw_transactions_resultset
    else
      @raw_transactions = TransactionsProcessingService.get_raw_transactions_data(@hash, @tx_count)
    end

    return @raw_transactions.count
  end

  # process raw transactions to get only required fields
  def process_raw_transactions()
    @transactions = TransactionsProcessingService.process_raw_transactions(@raw_transactions)
    return @transactions.count
  end

  # process and find out the ancestory set
  def update_ancestry_data()
    TransactionsProcessingService.update_ancestry_data(@transactions)
    return @transactions.count
  end

  # saves raw transactions data
  def save_raw_transactions()
    TransactionRepo.save("raw" + @hash, @raw_transactions)
    return @raw_transactions.count
  end

  # saves transactions data
  def save_transactions()
    TransactionRepo.save(@hash, @transactions)
    return @transactions.count
  end

  def print_top_ancestory_transactions()
    @transactions.sort_by {|k| k["ancestry_count"]}.last(10).reverse.each do |f|
      puts "#{f["txid"]} - #{f["ancestry_count"]}"
    end
  end
end
