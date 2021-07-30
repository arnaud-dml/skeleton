PROJECTS_PATH	= $(PWD)
APP_PATH		= $(PROJECT_PATH)/projects

export APP_URL	= project.local

## L'utilisation de la cible ".PHONY" permet d'utiliser make comme un simple système d'alias
.PHONY: init install clean

init: docker-up

install: git docker-start composer yarn tests

clean: docker-down

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

git:
ifdef GIT_BRANCH
	git add --all && git stash && git checkout $(BRANCH) && git fetch -p && git rebase
endif