install:
	python3 -m pip install --upgrade pip &&\
		pip install -r requirements.txt &&\
		python3 -m pip install pyinotify pytest virtualenv locust &&\
		virtualenv ~/.mypy3env &&\
		source ~/.mypy3env/bin/activate &&\
		which python3

test:
	python3 -m pytest -vv --cov=myrepolib tests/*.py &&\
	python3 -m pytest --nbval notebook.ipynb

lint:
	python3 -m pylint --disable=R,C app.py

all: install lint test
