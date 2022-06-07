class BlockStreamClient
  require 'httparty'

  CLIENT_ENDPOINT = "https://blockstream.info/api/"

  # curl https://blockstream.info/api/block-height/680000
  def self.get_hash(block_height)
    response = HTTParty.get(CLIENT_ENDPOINT + "block-height/" + block_height)

    return response.body if response.success?
  end

  # curl https://blockstream.info/api/block/000000000000000000076c036ff5119e5a5a74df77abf64203473364509f7732
  def self.get_block_info(block_hash)
    return HTTParty.get(CLIENT_ENDPOINT + "block/" + block_hash)
  end

  # curl https://blockstream.info/api/block/000000000000000000076c036ff5119e5a5a74df77abf64203473364509f7732/txs/
  # curl https://blockstream.info/api/block/000000000000000000076c036ff5119e5a5a74df77abf64203473364509f7732/txs/25
  def self.get_block_info(block_hash, offset)
    return HTTParty.get(CLIENT_ENDPOINT + "block/" + block_hash + "/txs/" + offset)
  end

end
