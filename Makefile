
run:
	gnuradio-companion ld_rf.grc &

decode:
	./tbc-tools/decode.AppImage ld output.s16 out/test_out -f 20

tbc:
	./tbc-tools/tbc-tools-x86_64.AppImage out/test_out.tbc

