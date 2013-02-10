# My shell scripting practice work

These are just for my reference and testing purpose.

## Prog1: Search hex stream in a given file by decreasing byte by byte from RHS

	sh p1_hex_search.sh <file_name> "<hex stream>"
	
	Ex: sh p1_hex_search.sh test.pcap "fc 91 2c 1d cd 60"
	
	fc 91 2c 1d cd :Not match
	fc 91 2c 1d :Not match
	fc 91 2c Match

	
