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

#OUTPUT for 680000
bd3204ede500b17d04b0f1d7373aafce1b4ba25352670c6618f76129c031cabc - 21
03b132918c3b83234c77305b664aa350898711e05cc882707163a3fdf6c515b9 - 20
e1bc0b939809e14b42a61ef25a60f7b1c94d3b800cb41930a906af5caa8b16b9 - 20
ab44f2b3528b2ee8e9bde40c88e887351f88cb855c468f2c61254ff49a16f1ab - 19
68609a897975de3744799f5a4c04723fb8c111963a5ef932e6c50c091c42d99b - 19
8abf82abafb88ab124ad09d8ae80048fa65ba5f9364b970f216a5d0566438ce8 - 18
26a5d391dd9f407c992fa05a6f2f16055476b4171a58ced7bf58253da93342fe - 18
7a6dcde048e9415c807964c7ba2c39e00cc41a991e15e512837d14a52484308f - 17
a45794a2af2839c311883414403c8210dfadc4b27cb2ac1032e988a99210e8dc - 17
852a414c7152507f991f6b8a4313f39eaf608d45950dee8b564ad07ed85b932a - 16
