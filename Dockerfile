FROM ruby:3.2.0

# Instalar dependências necessárias para o projeto
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Definir o diretório de trabalho
WORKDIR /myapp

# Atualizar Bundler
RUN gem install bundler:2.4.7

# Copiar Gemfile e Gemfile.lock
COPY Gemfile /myapp/Gemfile
#COPY Gemfile.lock /myapp/Gemfile.lock

# Instalar gems
RUN bundle install

# Copiar o restante dos arquivos
COPY . /myapp

# Comando para rodar o servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
