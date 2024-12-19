# django_project_management_tool
Project management tool

## Setup Instructions

1. **Clone the repository**:
   git clone <repository-url>
   cd project-management-tool
2. **Install dependencies**
  pip install -r requirements.txt
3. **Run Migration**
   python manage.py makemigrations
   python manage.py migrate
4. **Start Server**
   python manage.py runserver
5. Access the API Documentation:
   Go to http://localhost:8000/swagger/ to view the API documentation.

Endpoints:
Users: Register, login, update, and delete users.
Projects: Create, list, update, and delete projects.
Tasks: Create, list, update, and delete tasks.
Comments: Add, update, and delete comments on tasks.

This setup will allow you to manage users, projects, tasks, and comments for the project management tool using a Django backend. The API is well-documented, and the repository is ready for collaboration.
