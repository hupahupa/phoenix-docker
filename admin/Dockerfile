FROM elixir:1.3.2

MAINTAINER Duy Le <duyleminh1402@gmail.com>

ADD . /app
WORKDIR /app
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix compile
EXPOSE 6000

CMD ["mix", "phoenix.server"]