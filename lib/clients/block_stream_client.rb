class BlockStreamClient
  require 'httparty'
  require 'json'

  CLIENT_ENDPOINT = "https://blockstream.info/api/"

  # curl https://blockstream.info/api/block-height/680000
  def self.get_hash(block_height)
    # exception if input nil
    response = HTTParty.get(CLIENT_ENDPOINT + "block-height/" + block_height)

    response.success? ? response.body : throw_exception(response)
  end

  # curl https://blockstream.info/api/block/000000000000000000076c036ff5119e5a5a74df77abf64203473364509f7732
  def self.get_block_info(block_hash)
    # exception if input nil

    response =  HTTParty.get(CLIENT_ENDPOINT + "block/" + block_hash)

    puts response.body

    response.success? ? JSON.parse(response.body) : throw_exception(response)
  end

  # curl https://blockstream.info/api/block/000000000000000000076c036ff5119e5a5a74df77abf64203473364509f7732/txs/0
  # curl https://blockstream.info/api/block/000000000000000000076c036ff5119e5a5a74df77abf64203473364509f7732/txs/25
  def self.get_block_transactions(block_hash, offset)
    # exception if input nil
    response =  HTTParty.get(CLIENT_ENDPOINT + "block/" + block_hash + "/txs/" + offset.to_s)

    case response.code
    when 200
      return JSON.parse(response.body)
    when 404
      return []
    else
      throw_exception(response)
    end
  end

  private
  def self.throw_exception(response)
    raise "This is an exception"
  end
end
