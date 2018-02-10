run:
	@echo Visit `ipconfig getifaddr en0`:3000/
	bundle exec rackup -o 0.0.0.0 -p 3000
	
