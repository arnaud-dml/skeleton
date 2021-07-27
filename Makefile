PROJECTS_PATH	= $(PWD)
APP_PATH		= $(PROJECT_PATH)/projects

export APP_URL	= project.local

## L'utilisation de la cible ".PHONY" permet d'utiliser make comme un simple système d'alias
.PHONY: init install

init: docker-start

install: git docker-start composer yarn tests

docker-start:
	docker-compose up -d

git:
ifdef GIT_BRANCH
	git add --all && git stash && git checkout $(BRANCH) && git fetch -p && git rebase
endif