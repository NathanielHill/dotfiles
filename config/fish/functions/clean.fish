function clean
	find . -name node_modules -type d -exec rm -rf '{}' + $argv;
end
