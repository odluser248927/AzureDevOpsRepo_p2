import time 
from locust import HttpUser, task, between

class WebsiteUser(HttpUser):
  wait_time = between(1, 5)
    
  @task
  def hello_world(self):
    # self.client.get("/clf")
    self.client.get(url="http://localhost:$PORT/predict")

  @task
  def slow_page(self):
    # self.client.get(url="/slow")
    self.client.get("./make_prediction.sh")

  @task
  def scale(self):
    self.client.get("payload")

  @task
  def predict(self):
    self.client.get("clf")
