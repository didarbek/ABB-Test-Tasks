# Step Project 

Create a Phonebook web-application
--------------------------------------------------------
The application must consist of three parts: front-end (web-view), back-end (api and database logic) and database (mysql).

The back-end must have following API:
1. HTTP:80/user/add - Adding a new user with phone number
2. Expected JSON response: {"user_id": "[UNIQUE_USER_ID]", "operation_type": "add", "operation_status": "[fail | success]"}
3. HTTP:80/user/edit - Edit an existing user’s name or phone number
4. Expected JSON response: {"user_id": "[UNIQUE_USER_ID]", "operation_type": "edit", "operation_status": "[fail | success]"}
5. HTTP:80/user/list - Display all saved users and their phones in a table view
6. Expected JSON response:
[
 {
  "user_id": "[UNIQUE_USER_ID]",
  "name": "[USER_NAME]",
  "phone": "[PHONE_NUMBER]"
 },
 {
  "user_id": "[UNIQUE_USER_ID]",
  "name": "[USER_NAME]",
  "phone": "[PHONE_NUMBER]"
 },
 …
]
HTTP:80/user/delete - Delete a selected user by ID
Expected JSON response: {"user_id": "[UNIQUE_USER_ID]", "operation_type": "delete", "operation_status": "[fail | success]"}
1. HTTP:80/status - returns code 200 if the application is up and running and able to connect to the DB (try to answer a question: is such pattern for the healtcheck good or bad?)
2. Expected JSON response: {"status": "OK"}
(Hint: you’re allowed to use any type of underlying web-server (nginx, apache, no web-server at all…) and use any programming language (php, node.js, java, python))
The front end application must have the following API:
1. HTTP:80/ - Displays an html page with the phonebook (table view) + underlying node’s hostname in the page header. Design of the web-page is up to you and will not be scored.
2. HTTP:80/status - returns code 200 with empty payload if the application is up and running and able to connect to the back-end application to HTTP:80/status (the endpoint is returning code 200)

The application must run in Docker.
All docker-images must have Dockerfiles.
The application must run in AWS infrastructure.
The back-end and the database must not be accessible from Internet — only the front-end
For all the AWS-resources you must follow the “least privileges” principle.
All infrastructure must be described in code (Terraform)
You must use spot-instances (of any instance type) instead of on-demand EC2-instances to run the application
The application must run its replicas in at least 2 availability zones
The application must be horizontally scalable.
The application must be automatically scaled (with no manual operations allowed):
- the application must consist of minimum 2 and maximum 10 replicas (desired number of replicas: 2)
- the application must run 1 additional replica (but not more than the max number) if there are more than 30 requests per minute during 1 minute
- the application must stop 1 additional replica (but not less than the min number) if there are less than 10 requests per minute during 1 minute
All application’s replicas must use the same (common) database (a single instance)

Assessment submission form: a GitHub repository with all the related code ready to be deployed

ATTENTION!
1. Please make sure that during your work you have not exposed any secrets or credentials in public github repos. In case you find some sensitive information got compromised (or even potentially compromised) please rotate it immediately!
2. Please make sure you have destroyed all the AWS resources after you have finished your work in order to avoid frustrating billing “surprises” from AWS in the end of the month. Periodically check the billing section of your AWS account in order to control your account expenses!
3. Make sure you have securely protected access to your AWS account: delete or block all unused IAM-resources in order to avoid unauthorised access to your account!
