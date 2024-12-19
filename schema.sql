-- Users Table
CREATE TABLE Users (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Username TEXT UNIQUE NOT NULL,
    Email TEXT UNIQUE NOT NULL,
    Password TEXT NOT NULL,
    First_name TEXT NOT NULL,
    Last_name TEXT NOT NULL,
    Date_joined DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Projects Table
CREATE TABLE Projects (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Description TEXT,
    Owner INTEGER NOT NULL,
    Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Owner) REFERENCES Users(Id) ON DELETE CASCADE
);

-- ProjectMembers Table
CREATE TABLE ProjectMembers (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Project INTEGER NOT NULL,
    User INTEGER NOT NULL,
    Role TEXT CHECK(Role IN ('Admin', 'Member')) NOT NULL,
    FOREIGN KEY (Project) REFERENCES Projects(Id) ON DELETE CASCADE,
    FOREIGN KEY (User) REFERENCES Users(Id) ON DELETE CASCADE
);

-- Tasks Table
CREATE TABLE Tasks (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,   -- Primary Key
    Title TEXT NOT NULL,                    -- Task title
    Description TEXT,                       -- Detailed description
    Status TEXT CHECK(Status IN ('To Do', 'In Progress', 'Done')) DEFAULT 'To Do', -- Task status
    Priority TEXT CHECK(Priority IN ('Low', 'Medium', 'High')) DEFAULT 'Medium',   -- Task priority
    Assigned_to INTEGER,                    -- Foreign Key (to Users, nullable)
    Project INTEGER NOT NULL,               -- Foreign Key (to Projects)
    Created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Task creation timestamp
    Due_date DATETIME,                      -- Due date for task
    FOREIGN KEY (Assigned_to) REFERENCES Users(Id) ON DELETE SET NULL, -- Nullable
    FOREIGN KEY (Project) REFERENCES Projects(Id) ON DELETE CASCADE
);

-- Comments Table
CREATE TABLE Comments (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,   -- Primary Key
    Content TEXT NOT NULL,                  -- Comment content
    User INTEGER NOT NULL,                  -- Foreign Key (to Users)
    Task INTEGER NOT NULL,                  -- Foreign Key (to Tasks)
    Created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Comment creation timestamp
    FOREIGN KEY (User) REFERENCES Users(Id) ON DELETE CASCADE,
    FOREIGN KEY (Task) REFERENCES Tasks(Id)
