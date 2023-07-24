# ['C:/Users/ryan/Documents/projects/chip8asm/.venv/Scripts/chip8disassembler', '../tetris_reassembled_ch8/original/Tetris [Fran Dachille, 1991].ch8', '../tetris_reassembled_ch8/tetris_reassembled.asm', '--sprite-addrs', '0x2b4', '0x2c4:0x334']

call @drawscore


va = 0x00

v1 = 0x1f
v5 = 0x10

v2 = 0

i = @dotsprite

v0 = 0x19
@loopdrawbottombar
v0 += 0x01
draw v0 v1 0x1
if v0 != 0x25
goto @loopdrawbottombar

@loopdrawsidebars
v1 += 0xff
draw v0 v1 0x1
v0 = 0x1a
draw v0 v1 0x1
v0 = 0x25
if v1 != 0x00
goto @loopdrawsidebars

call @setrandblock
call @draw_preview_block


@gameloopstart
call @draw_preview_block

v3 = v6
v4 = v7

call @setrandblock

call @draw_preview_block

# starting coords to draw piece
v0 = 0x1e
v1 = 0x00
call @set_i_to_block_sprite  # set i to block sprite
@label22a
delay = v5
draw v0 v1 0x4
if vf != 0x01
goto @label23c

@gameover
if v1 == 0
goto @gameover

draw v0 v1 0x4
v1 += 0xff
draw v0 v1 0x4
call @label340
goto @gameloopstart

# button time loop
@label23c

if v2 == 0
goto @checkkeys
if key v2
goto @keyheld

@checkkeys
v2 = 5
if !key v2
goto @key6
v9 = 0xff
call @moveside
goto @keyheld

@key6
v2 = 6
if !key v2
goto @key4
v9 = 1
call @moveside
goto @keyheld


@key4
v2 = 4
if !key v2
goto @key8
v9 = 4 # 0xfc
call @handlerotation
goto @keyheld

@key8
v2 = 8
if !key v2
goto @key7
v9 = 0x20
call @movedown
goto @keyheld

@key7
v2 = 7
if !key v2
goto @lastkey
v9 = 2
call @movedown
goto @keyheld

@lastkey
v2 = 0

@keyheld

@label250
vc = delay
if vc != 0x00
goto @label23c

@timeout

draw v0 v1 0x4
v1 += 0x01
goto @label22a

@set_i_to_block_sprite
i = @label2c4
i += v4
i += v3
return

@movedown
if v9 == 0
return
v9 += 0xff
draw v0 v1 0x4
v1 += 1
draw v0 v1 0x4
if vf != 0x01
goto @movedown
draw v0 v1 0x4
v1 += 0xFF
draw v0 v1 0x4
return

@moveside
draw v0 v1 0x4
v0 += v9
draw v0 v1 0x4
if vf != 0x01
return
draw v0 v1 0x4
v0 -= v9
draw v0 v1 0x4
return

@handlerotation
draw v0 v1 0x4 # undraw piece
vc = v3
v3 += v9     # increment rotation
v9 = 0xc
v3 &= v9
call @set_i_to_block_sprite
draw v0 v1 0x4
if vf != 0x01
return
draw v0 v1 0x4
v3 = vc
call @set_i_to_block_sprite
draw v0 v1 0x4
return

@label340
vc = v1
if vc != 0x1e
vc += 0x01
if vc != 0x1e
vc += 0x01
if vc != 0x1e
vc += 0x01
@label350
call @check_line
if vf == 0
call @label372
if v1 == vc
return
v1 += 0x01
goto @label350


@check_line
# check line v1 to see if it's complete
# at return vf will be 0 for complete line
i = @bar5sprite
v0 = 0x1b
draw v0 v1 0x1
draw v0 v1 0x1
if vf != 0
return
v0 = 0x20
draw v0 v1 0x1
draw v0 v1 0x1
return


@label372
# clear the line
v0 = 0x1b
i = @bar5sprite
draw v0 v1 0x1
v0 += 5
draw v0 v1 0x1

i = @dotsprite

ve = v1
vd = ve
ve += 0xff
@label382
v0 = 0x1b
vb = 0x00
@label386
draw v0 ve 0x1
if vf != 0x00
goto @label390
draw v0 ve 0x1
goto @label394
@label390
draw v0 vd 0x1
vb += 0x01
@label394
v0 += 0x01
if v0 != 0x25
goto @label386
if vb == 0x00
goto @label3a6
vd += 0xff
ve += 0xff
if vd != 0x01
goto @label382
@label3a6
call @drawscore
va += 0x01
call @drawscore
v0 = va
vd = 0x07
v0 &= vd
if v0 == 0x04
v5 += 0xfe
if v5 == 0x02
v5 = 0x04
return

@drawscore
i = 0x700
dump v4
i = 0x804
bcd va
load v2
i = font v0
v3 = 0x31
v4 = 0x01
draw v3 v4 0x5
v3 += 0x05
i = font v1
draw v3 v4 0x5
v3 += 0x05
i = font v2
draw v3 v4 0x5
i = 0x700
load v4
i = @dotsprite
return

@setrandblock
# v4 = rand 0-6 *16, v3 = rand 0-3
v7 = rand 0x70
if v7 == 0x70
goto @setrandblock

# rand orientation
v6 = rand 0x0c
return

@draw_preview_block
v0 = 0x30
v1 = 0xe
i = @label2c4
i += v6
i += v7
draw v0 v1 4
return

@dotsprite
u8 0b10000000
u8 0b00000000

@bar5sprite
u8 0b11111000
u8 0b00000000

@label2c4
u8 0b01000000
u8 0b11100000
u8 0b00000000
u8 0b00000000
u8 0b01000000
u8 0b11000000
u8 0b01000000
u8 0b00000000
u8 0b00000000
u8 0b11100000
u8 0b01000000
u8 0b00000000
u8 0b01000000
u8 0b01100000
u8 0b01000000
u8 0b00000000
u8 0b01000000
u8 0b01000000
u8 0b01100000
u8 0b00000000
u8 0b00100000
u8 0b11100000
u8 0b00000000
u8 0b00000000
u8 0b11000000
u8 0b01000000
u8 0b01000000
u8 0b00000000
u8 0b00000000
u8 0b11100000
u8 0b10000000
u8 0b00000000
u8 0b01000000
u8 0b01000000
u8 0b11000000
u8 0b00000000
u8 0b00000000
u8 0b11100000
u8 0b00100000
u8 0b00000000
u8 0b01100000
u8 0b01000000
u8 0b01000000
u8 0b00000000
u8 0b10000000
u8 0b11100000
u8 0b00000000
u8 0b00000000
u8 0b01000000
u8 0b11000000
u8 0b10000000
u8 0b00000000
u8 0b11000000
u8 0b01100000
u8 0b00000000
u8 0b00000000
u8 0b01000000
u8 0b11000000
u8 0b10000000
u8 0b00000000
u8 0b11000000
u8 0b01100000
u8 0b00000000
u8 0b00000000
u8 0b10000000
u8 0b11000000
u8 0b01000000
u8 0b00000000
u8 0b00000000
u8 0b01100000
u8 0b11000000
u8 0b00000000
u8 0b10000000
u8 0b11000000
u8 0b01000000
u8 0b00000000
u8 0b00000000
u8 0b01100000
u8 0b11000000
u8 0b00000000
u8 0b11000000
u8 0b11000000
u8 0b00000000
u8 0b00000000
u8 0b11000000
u8 0b11000000
u8 0b00000000
u8 0b00000000
u8 0b11000000
u8 0b11000000
u8 0b00000000
u8 0b00000000
u8 0b11000000
u8 0b11000000
u8 0b00000000
u8 0b00000000
u8 0b01000000
u8 0b01000000
u8 0b01000000
u8 0b01000000
u8 0b00000000
u8 0b11110000
u8 0b00000000
u8 0b00000000
u8 0b01000000
u8 0b01000000
u8 0b01000000
u8 0b01000000
u8 0b00000000
u8 0b11110000
u8 0b00000000
u8 0b00000000