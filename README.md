# My shell scripting practice work

These are just for my reference and testing purpose.

## Tool: Search hex stream in a given file by decreasing byte by byte from RHS

	sh hex_search.sh <file_name> "<hex stream>"
	
	Ex: sh hex_search.sh test.pcap "fc 91 2c 1d cd 60"
	
	fc 91 2c 1d cd :Not match
	fc 91 2c 1d :Not match
	fc 91 2c Match

## Tool: CSV to HTML converter
### Usage:
	USAGE:: ./csv2html.sh <input-csv-file>
	USAGE:: ./csv2html.sh <input-csv-file> <delimiter>

	
