module App
  require_relative 'lib/block'

  def self.start()
    block = Block.new("680000")

    block.populate_raw_transactions()
    puts ""

    block.save_raw_transactions()
    puts ""

    block.process_raw_transactions()
    puts ""

    block.save_transactions()
    puts ""

    block.update_ancestry_data()
    puts ""

    block.print_top_ancestory_transactions()
    puts ""
  end
end

App.start()
