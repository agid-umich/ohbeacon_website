FROM ruby:2.7.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /usr/src/eecshelp
WORKDIR /usr/src/eecshelp
ADD Gemfile /usr/src/eecshelp/Gemfile
ADD Gemfile.lock /usr/src/eecshelp/Gemfile.lock
RUN bundle install
ADD . /usr/src/eecshelp
EXPOSE 3000
ENTRYPOINT ["/usr/src/eecshelp/script/wait-for-it.sh", "-t", "60", "db:3306", "--", "bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0"]
CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
