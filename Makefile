install:
	bundle install

setup-serve:
	bundle exec rake db:setup

serve:
	bundle exec rails s
