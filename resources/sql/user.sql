CREATE TABLE user (
	userID VARCHAR(20),
	userPassword VARCHAR(20),
	userName VARCHAR(20),
	userEmail VARCHAR(50),
	PRIMARY KEY (userID)
)default CHARSET=utf8;

select * from user;


drop table user;

INSERT INTO user VALUES('sooy', 0417, '�ּ���', 'tndusdlsms@nate.com');
INSERT INTO user VALUES('qazqaz45', 'qaz4646', 'ȫ�浿', 'dongdong@nate.com');
