# Merkle-Damgard Hash algorithm - Exploration

Chapter 1 Excercise - Symmetric Cryptogaphy Essential Training course

Given a simple 64 bit hash compression function, implement the overall Merhle-Damgard algoritm.

## Input:
```js
plainText = "QUITE THE TEST CASE YOU HAVE THERE"
IV = 0x439D148AA5B55A8C   // Initial Vector
```

## Algorithm:
- Capture message
- Calculate message size
- Set block size
- Pad message with '0' if message size is not an exact multiple of block size.  ( using modulo operator )
- Initialize hashed block with IV
- Loop until end of message ( reading one block a time )
  -	Transfer next message block chars into local block
  -	Calculate new hashed block calling:  hash(left=local block, right=hashed block )
- Return last hash bock

## Output
```js
hash=0xB0832B0C612C213C
```

### Execution Output Sample
```js
n=0
plaintextBlock=QUITE TH
MyCompression() ->left=4854204554495551, rigth=439d148aa5b55a8c
n=1
plaintextBlock=E TEST C
MyCompression() ->left=4320545345542045, rigth=6e77a27b8ee0abd6
n=2
plaintextBlock=ASE YOU 
MyCompression() ->left=20554f5920455341, rigth=b1d413e74aded8b4
n=3
plaintextBlock=HAVE THE
MyCompression() ->left=4548542045564148, rigth=f3050058d9fdc273
n=4
plaintextBlock=RE
MyCompression() ->left=4552, rigth=2cd39183c09d1750
The hash value is: 0xB0832B0C612C213C
```

### Note: 
About endianness:
This code assumets default as little-endian system ( least significant byte is stored first ),
so plain text block gets transfered to the compression function as "inverted" bytes. 
code:
```js
 left <-- *(uint64_t *)plaintextBlock
```
For instance:
```js
plaintextBlock="QUITE TH"
Hex: 0x5155495445205448  ( 51 55 49 54 45 20 54 48 )
Inside compression function:  left= 0x4854204554495551   ( 48 54 20 45 54 49 55 51 )
```
## MyCompression() hash function
![image](https://github.com/user-attachments/assets/154cc343-bc00-4a4b-849b-1b77567ae077)
