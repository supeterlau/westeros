MORSE_CODE = {'.-': 'A', '-...': 'B', '-.-.': 'C', '-..': 'D', '.': 'E', '..-.': 'F', '--.': 'G', '....': 'H', '..': 'I', '.---': 'J', '-.-': 'K', '.-..': 'L', '--': 'M', '-.': 'N', '---': 'O', '.--.': 'P', '--.-': 'Q', '.-.': 'R', '...': 'S', '-': 'T', '..-': 'U', '...-': 'V', '.--': 'W', '-..-': 'X', '-.--': 'Y', '--..': 'Z', '-----': '0', '.----': '1', '..---': '2', '...--': '3', '....-': '4', '.....': '5', '-....': '6', '--...': '7', '---..': '8', '----.': '9', '.-.-.-': '.', '--..--': ',', '..--..': '?', '.----.': "'", '-.-.--': '!', '-..-.': '/', '-.--.': '(', '-.--.-': ')', '.-...': '&', '---...': ':', '-.-.-.': ';', '-...-': '=', '.-.-.': '+', '-....-': '-', '..--.-': '_', '.-..-.': '"', '...-..-': '$', '.--.-.': '@', '...---...': 'SOS'}

def get_replace_map_0(bits):
    acc = ""
    for bit in bits:
        if bit == "1":
            acc += bit
        if bit == "0" and acc != "":
            break
    acc_length = len(acc)
    dots = acc[0:acc_length//3] if acc_length % 3 == 0 else acc
    dashs = dots * 3
    return {
        dashs: "-",
        dots: ".",
        "0"*len(dots)*7: "  ",
        "0"*len(dots)*3: " ",
        "0"*len(dots): "",
    }

def get_replace_map(bits):
    min_one = min(map(lambda token: len(token), bits.replace('0',' ').split()))
    min_zero = min(map(lambda token: len(token), bits.replace('1',' ').split()))
    dots = (min(min_one, min_zero) if min_one * min_zero != 0 else min_one+min_zero) * '1'
    print(dots)
    dashs = dots * 3
    return {
        dashs: "-",
        dots: ".",
        "0"*len(dots)*7: "  ",
        "0"*len(dots)*3: " ",
        "0"*len(dots): "",
    }

def decode_bits(bits):
    replace_map = get_replace_map(bits)
    for k in replace_map:
        bits = bits.replace(k, replace_map[k])
    print('bits')
    print(bits)
    return bits

def decode_morse(morseCode):
    # ToDo: Accept dots, dashes and spaces, return human-readable message
    # morseCode = decode_bits(morseCode)
    codes = morseCode.split()
    for code in sorted(codes, key=lambda v: len(v), reverse=True):
        morseCode = morseCode.replace(code, MORSE_CODE[code])
    return ' '.join(
      map(lambda string: string.replace(' ', ''), morseCode.split('  '))
    )

# print(decode_bits("1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011"))
print(decode_morse(decode_bits("1100110011001100000011000000111111001100111111001111110000000000000011001111110011111100111111000000110011001111110000001111110011001100000011")))
print(decode_morse(decode_bits("111000111")))
print(decode_morse(decode_bits('111000000000111')))
