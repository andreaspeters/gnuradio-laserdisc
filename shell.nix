with import <nixpkgs> {};

stdenv.mkDerivation {
name = "gnuradio-env";

buildInputs = [
	python313
	python313Packages.numpy
	python313Packages.pyqt5
	python313Packages.thrift
	python313Packages.pygccxml
	python313Packages.pybind11
	python313Packages.qtpy
	libsndfile
	uhd
  thrift
	gnuradioPackages.osmosdr
	gnuradioPackages.lora_sdr
	gnuradioPackages.bladeRF
	gnuradioPackages.fosphor
	gnuradio

];

SOURCE_DATE_EPOCH = 315532800;
PROJDIR = "/tmp/python-dev";
S_NETWORK="host";
S_CONTAINER="true";

shellHook = ''
	export PYTHONPATH=${gnuradioPackages.osmosdr}/lib/python3.13/site-packages:$PYTHONPATH
	export LD_LIBRARY_PATH=${gnuradioPackages.osmosdr}/lib:$LD_LIBRARY_PATH
	export GRC_BLOCKS_PATH=${gnuradioPackages.osmosdr}/share/gnuradio/grc/blocks:$GRC_BLOCKS_PATH
	unset VIRTUAL_ENV
	'';
}
