.PHONY: install setup-serve serve

install:
	bundle install; \
	npm install;

setup-serve:
	bundle exec rails db:setup; \
	bundle exec rails db:migrate;

serve:
	bundle exec rails s --binding 0.0.0.0
