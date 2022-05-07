FROM ruby:2.5.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# set a directory for the app
WORKDIR /usr/src/app
# copy all the files to the container
COPY . .
# install dependencies
RUN gem install bundler -v 2.1.4
RUN bundle 
# port
EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]