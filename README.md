# README

Ruby version 3.0.3
Rails version 7.0.8

## Development with docker-compose (optional)

### Prerequisites

1. [Install docker](https://docs.docker.com/get-docker/)
2. [Install docker-compose](https://docs.docker.com/compose/install/)
3. Don't forget [Post-install section (for linux)](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)
4. Add an alias for `docker-compose` for ease use

```bash
echo "alias dcdev='docker compose -f docker-compose-dev.yml'" >> ~/.bashrc
echo "alias dcdevb='docker compose -f docker-compose-dev.yml run web bash'" >> ~/.bashrc
echo "alias dct='docker compose -f docker-compose-dev.yml -f docker-compose-test.yml'" >> ~/.bashrc
echo "alias dctb='docker compose -f docker-compose-dev.yml -f docker-compose-test.yml run test bash'" >> ~/.bashrc

# For Oh My Zsh
echo "alias dcdev='docker compose -f docker-compose-dev.yml'" >> ~/.zshrc
echo "alias dcdevb='docker compose -f docker-compose-dev.yml run web bash'" >> ~/.zshrc
echo "alias dct='docker compose -f docker-compose-dev.yml -f docker-compose-test.yml'" >> ~/.zshrc
echo "alias dctb='docker compose -f docker-compose-dev.yml -f docker-compose-test.yml run test bash'" >> ~/.zshrc
```

5. Reload your rc file

```bash
. ~/.bashrc

# For Oh My Zsh
. ~/.zshrc
```

6. For Redis, add `vm.overcommit_memory = 1` to your `/etc/sysctl.conf`

### First run

1. Copy and edit `.env` file

```bash
cp docker_dev/.env_docker.example docker_dev/.env_docker
```

2. Build an image

```bash
dcdev build
```

3. Run app

```bash
dcdev up
```

4. Create a Database and run migrations

```bash
dcdev run web bundle exec rails db:setup
# or
dcdev run web bundle exec rails db:create
dcdev run web bundle exec rails db:schema:load
dcdev run web bundle exec rails db:seed
```

### Regular dev workflow

1. Run `dcdev up` and you are good to go.
2. To run any Rails related command, just shell `dcdev run web bash` and execute anything you want inside container.
3. You can use or add any aliases you want, see `docker_dev/Dockerfile`. Don't forget to rebuild an image: Run `dcdev down` to stop everything and `dcdev build` to rebuild
4. You might have an issues on Linux OS with permissions on files that created by Docker. Just run chown `sudo chown -R YOUR_USER:YOUR_GROUP .`

