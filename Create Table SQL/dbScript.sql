
CREATE DATABASE IF NOT EXISTS onlinegreivancemanagementsystem;
use onlinegreivancemanagementsystem;
GRANT ALL PRIVILEGES ON *.* TO 'aicte_db_user'@'localhost' IDENTIFIED BY 'aicTe@@$$' with GRANT option;
GRANT SELECT  ON `onlinegreivancemanagementsystem`.* TO 'aicte_user'@'localhost' IDENTIFIED BY 'myteam';
GRANT SELECT,UPDATE,INSERT,DELETE  ON `onlinegreivancemanagementsystem`.* TO 'aicte_app_user'@'localhost' IDENTIFIED BY 'AiCtE@123$$#';

