import requests
import json

def test_users_list():
	response = requests.get("/user/list")

	assert response.status_code = 200, "You have some problem"
	assert user_list is not None, "You have no users!"

def test_user_insert():
	data = {
         "name": "John", 
         "phone": "12345"
       }
	response = requests.post("/user/add", json=json.dumps(data))
	json_response = response.json()

	assert response.status_code = 200, "You have some problem"
	assert json_response == {"user_id": 1, "operation_type": "add", "operation_status": "success"}, "User insertion failed"

def test_user_edit():
	data = {
         "name": "Michael", 
         "phone": "123"
       }
	response = requests.put("/user/edit/1", json=json.dumps(data))
	json_response = response.json()

	assert response.status_code = 200, "You have some problem"
	assert json_response == {"user_id": 1, "operation_type": "edit", "operation_status": "success"}, "User editing failed"

def test_user_delete():
	response = requests.delete("/user/delete/1")
	json_response = response.json()

	assert response.status_code = 200, "You have some problem"
	assert json_response == {"user_id": 1, "operation_type": "delete", "operation_status": "success"}, "User deletion failed"

def test_status():
	response = requests.get("/status")
	json_response = response.json()

	assert response.status_code = 200, "You have some problem"
	assert json_response == {"status": "OK"}, "Something is wrong with service"