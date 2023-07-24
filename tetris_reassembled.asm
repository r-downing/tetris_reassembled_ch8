# ['C:/Users/ryan/Documents/projects/chip8asm/.venv/Scripts/chip8disassembler', '../tetris_reassembled_ch8/original/Tetris [Fran Dachille, 1991].ch8', '../tetris_reassembled_ch8/tetris_reassembled.asm', '--sprite-addrs', '0x2b4', '0x2c4:0x334']
i = @label2b4
call @label3e6
call @label2b6
@label206
v0 += 0x01
draw v0 v1 0x1
if v0 != 0x25
goto @label206
@label20e
v1 += 0xff
draw v0 v1 0x1
v0 = 0x1a
draw v0 v1 0x1
v0 = 0x25
if v1 != 0x00
goto @label20e
@label21c
v4 = rand 0x70
if v4 == 0x70
goto @label21c
v3 = rand 0x03
v0 = 0x1e
v1 = 0x03
call @label25c
@label22a
delay = v5
draw v0 v1 0x4
if vf != 0x01
goto @label23c
draw v0 v1 0x4
v1 += 0xff
draw v0 v1 0x4
call @label340
goto @label21c
@label23c
if key v7
call @label272
if key v8
call @label284
if key v9
call @label296
if !key v2
goto @label250
v6 = 0x00
delay = v6
@label250
v6 = delay
if v6 != 0x00
goto @label23c
draw v0 v1 0x4
v1 += 0x01
goto @label22a
@label25c
i = @label2c4
i += v4
v6 = 0x00
if v3 == 0x01
v6 = 0x04
if v3 == 0x02
v6 = 0x08
if v3 == 0x03
v6 = 0x0c
i += v6
return
@label272
draw v0 v1 0x4
v0 += 0xff
call @label334
if vf != 0x01
return
draw v0 v1 0x4
v0 += 0x01
call @label334
return
@label284
draw v0 v1 0x4
v0 += 0x01
call @label334
if vf != 0x01
return
draw v0 v1 0x4
v0 += 0xff
call @label334
return
@label296
draw v0 v1 0x4
v3 += 0x01
if v3 == 0x04
v3 = 0x00
call @label25c
call @label334
if vf != 0x01
return
draw v0 v1 0x4
v3 += 0xff
if v3 == 0xff
v3 = 0x03
call @label25c
call @label334
return
@label2b4
u8 0b10000000
u8 0b00000000
@label2b6
v7 = 0x05
v8 = 0x06
v9 = 0x04
v1 = 0x1f
v5 = 0x10
v2 = 0x07
return
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
@label334
draw v0 v1 0x4
v6 = 0x35
@label338
v6 += 0xff
if v6 != 0x00
goto @label338
return
@label340
i = @label2b4
vc = v1
if vc != 0x1e
vc += 0x01
if vc != 0x1e
vc += 0x01
if vc != 0x1e
vc += 0x01
@label350
call @label35e
if vb == 0x0a
call @label372
if v1 == vc
return
v1 += 0x01
goto @label350
@label35e
v0 = 0x1b
vb = 0x00
@label362
draw v0 v1 0x1
if vf != 0x00
vb += 0x01
draw v0 v1 0x1
v0 += 0x01
if v0 != 0x25
goto @label362
return
@label372
v0 = 0x1b
@label374
draw v0 v1 0x1
v0 += 0x01
if v0 != 0x25
goto @label374
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
call @label3c0
if vf != 0x01
call @label3c0
va += 0x01
call @label3c0
v0 = va
vd = 0x07
v0 &= vd
if v0 == 0x04
v5 += 0xfe
if v5 == 0x02
v5 = 0x04
return
@label3c0
i = 0x700
dump v2
i = 0x804
bcd va
load v2
i = font v0
vd = 0x32
ve = 0x00
draw vd ve 0x5
vd += 0x05
i = font v1
draw vd ve 0x5
vd += 0x05
i = font v2
draw vd ve 0x5
i = 0x700
load v2
i = @label2b4
return
@label3e6
va = 0x00
v0 = 0x19
return
if v7 != 0x23