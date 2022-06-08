# crypto-transaction-util

https://blockstream.info

This utility uses blockstream for fetching info

Start - https://github.com/Blockstream/esplora/blob/master/API.md#get-blockhashtxsstart_index

# DRY run of how to calculate the transaction ancestory

T1
from [a1]
to [a3, a4]
TMP_HASH = {a3 => [T1], a4 => [T1]}


T2
from [a4]
to [a5, a6, a7]
TMP_HASH = {a3 => [T1], a4 => [T1], a5 => [T2], a6 => [T2], a7 =>[T2]}


T3
from [a5]
to [a1]
TMP_HASH = {a3 => [T1], a4 => [T1], a5 => [T2], a6 => [T2], a7 =>[T2], a1 => [T3]}



T4
from [a1]
to [a10, a11, a12]
TMP_HASH = {a3 => [T1], a4 => [T1], a5 => [T2], a6 => [T2], a7 =>[T2], a1 => [T3]}
