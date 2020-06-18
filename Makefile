.PHONY: install setup-serve serve

install:
	bundle install

setup-serve:
	bundle exec rake db:setup

serve:
	bundle exec rails s --binding 0.0.0.0
