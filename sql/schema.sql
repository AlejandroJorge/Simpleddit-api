CREATE TABLE User (
  User_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Email TEXT NOT NULL UNIQUE,
  Hashed_Password TEXT NOT NULL,
  Registration_Date INTEGER NOT NULL
);

CREATE TABLE Profile (
  User_ID INTEGER PRIMARY KEY,
  Display_Name TEXT NOT NULL,
  Tag_Name TEXT NOT NULL UNIQUE,
  Picture_Path TEXT,
  Background_Path TEXT,
  FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Following (
  Followed_ID INTEGER,
  Follower_ID INTEGER,
  Following_Date INTEGER NOT NULL,
  FOREIGN KEY (Followed_ID) REFERENCES Profile(User_ID),
  FOREIGN KEY (Follower_ID) REFERENCES Profile(User_ID),
  PRIMARY KEY (Followed_ID, Follower_ID)
);

CREATE TABLE Post (
  Post_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Title TEXT NOT NULL,
  Description TEXT NOT NULL,
  Content TEXT NOT NULL,
  Creation_Date TEXT NOT NULL,
  Owner_ID INTEGER NOT NULL,
  FOREIGN KEY (Owner_ID) REFERENCES Profile(User_ID)
);

CREATE TABLE Post_Likings (
  Post_ID INTEGER,
  Liker_ID INTEGER,
  FOREIGN KEY (Post_ID) REFERENCES Post(Post_ID),
  FOREIGN KEY (Liker_ID) REFERENCES Profile(User_ID),
  PRIMARY KEY (Post_ID, Liker_ID)
);

CREATE TABLE Comment (
  Comment_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Post_ID INTEGER NOT NULL,
  User_ID INTEGER NOT NULL,
  Content TEXT NOT NULL,
  FOREIGN KEY (Post_ID) REFERENCES Post(Post_ID),
  FOREIGN KEY (User_ID) REFERENCES Profile(User_ID)
);

CREATE TABLE Comment_Likings (
  Comment_ID INTEGER,
  Liker_ID INTEGER,
  FOREIGN KEY (Comment_ID) REFERENCES Comment(Comment_ID),
  FOREIGN KEY (Liker_ID) REFERENCES Profile(User_ID),
  PRIMARY KEY (Comment_ID, Liker_ID)
);
