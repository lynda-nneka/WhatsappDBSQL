CREATE TABLE Users (
    PhoneNumber INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
	UserName VARCHAR(50) NOT NULL,
    ProfilePicture VARCHAR(MAX)
);


CREATE TABLE Messages (
    MessageID INT  PRIMARY KEY NOT NULL,
    SenderID INT NOT NULL,
    ReceiverID INT NOT NULL,
    MessageText NVARCHAR(MAX) NOT NULL,
    SentDate TIMESTAMP NOT NULL,
    FOREIGN KEY (SenderID) REFERENCES Users(PhoneNumber),
    FOREIGN KEY (ReceiverID) REFERENCES Users(PhoneNumber)
);
CREATE TABLE GroupChat (
    GroupID INT PRIMARY KEY NOT NULL,
    GroupName VARCHAR(255) NOT NULL,
	GroupDescription NVARCHAR(500) NOT NULL,
	CreatedBy DATETIME NOT NULL,
    TextMessage TEXT NOT NULL,
    SenderID INT NOT NULL,
    TimeSent TIMESTAMP NOT NULL,
    FOREIGN KEY (SenderID) REFERENCES Users(PhoneNumber),
    FOREIGN KEY (GroupID) REFERENCES Users(PhoneNumber)
);
CREATE TABLE GroupAdmins(
	GroupID INT PRIMARY KEY NOT NULL,
	UserID INT NOT NULL,
	FOREIGN KEY (GroupID) REFERENCES GroupChat(GroupID),
	FOREIGN KEY (UserID) REFERENCES Users(PhoneNumber),
)

SELECT
Sender.FirstName AS SenderName,
Recipient.FirstName AS RecepientName,
messages.MessageText,
messages.SentDate
FROM messages
JOIN users AS Sender ON Sender.PhoneNumber = Messages.SenderID
JOIN users AS Recipient ON Recipient.PhoneNumber = messages.ReceiverID;






















