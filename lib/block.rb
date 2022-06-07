class Block
  require_relative 'clients/block_stream_client'

  def initialize(block_height)
    @options = { data: { block_height: block_height } }
  end

  def hash
    BlockStreamClient.get_hash(@options[:data][:block_height])
  end

  # def users
  #   self.class.get("/2.2/users", @options)
  # end
end
