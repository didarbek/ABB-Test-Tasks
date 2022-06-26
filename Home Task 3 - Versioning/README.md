# Home Task 3 - Versioning

intro

here is the small application.

it just exposes one endpoint /user/:id
it expects integer user id
it returns te user
task 1

describe all steps needed for safe migration response type User(id, name) to User(Int id, String firstName, String lastName)
suppose the current version of this artifact is 1.5
how would you bring versioning to the API?
what is the next version if artifact should be?
task 2

describe all steps needed for safe migration response type User(id, name) to User(Int id, String name, List<String> skills)
suppose the current version of this artifact is 1.5
how would you bring versioning to the API?
what is the next version if artifact should be?
definition of done

all steps should be described in plain english
all meaningful things like versioning, urls, User data types need to be specified