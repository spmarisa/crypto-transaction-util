# crypto-transaction-util

https://blockstream.info

This utility uses blockstream for fetching info

Start - https://github.com/Blockstream/esplora/blob/master/API.md#get-blockhashtxsstart_index


txid - f4c3f0737be2bd3efbd23212afb174f667d4c30191c0d747dc6cdf1c3b7e059c
vin - bc1qq28ltwdzh44r29a3t2nhp6e9jm6cnmpkjql02n
vout - bc1qt3eqtd73mzu8053n2pnyflzpu8hzq2zlcghdar


txid - f4c3f0737be2bd3efbd23212afb174f667d4c30191c0d747dc6cdf1c3b7e059c
vin - bc1qq28ltwdzh44r29a3t2nhp6e9jm6cnmpkjql02n
vout - bc1q8x4xn0g80axsgt94md3c8weyxytxxmpm77jp7z


require './block.rb'
block = Block.new("680000")

block.populate_raw_transactions()

block.save_raw_transactions()

block.process_raw_transactions()

block.save_transactions()


require './clients/block_stream_client.rb'
