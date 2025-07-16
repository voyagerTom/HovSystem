-- Schema: hov (可省略 schema，這裡我示範保留)

--CREATE SCHEMA IF NOT EXISTS hov;
--SET search_path TO hov;

-- hov.hov_user definition

CREATE TABLE IF NOT EXISTS hov_user (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);

-- hov.carpool definition

CREATE TABLE IF NOT EXISTS  carpool (
  id SERIAL PRIMARY KEY,
  driver_id INT NOT NULL,
  launch_time VARCHAR(255),
  site VARCHAR(255),
  destination VARCHAR(255),
  pick_amt INT NOT NULL,
  order_amt INT NOT NULL,
  is_cancel VARCHAR(255),
  create_time VARCHAR(255)
);

-- hov.driver definition

CREATE TABLE IF NOT EXISTS driver (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  role_name VARCHAR(255),
  role_name_chinese VARCHAR(255)
);

-- hov.role definition

CREATE TABLE IF NOT EXISTS role (
  id INT PRIMARY KEY,
  role_name VARCHAR(30) NOT NULL,
  role_name_chinese VARCHAR(30) NOT NULL
);

-- hov.approve_todo_list definition

CREATE TABLE IF NOT EXISTS approve_todo_list (
  atl_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  msg VARCHAR(255),
  apply_time VARCHAR(255),
  is_approve VARCHAR(255) DEFAULT 'TBD',
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role (id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES hov_user (user_id)
);

-- hov.carpool_map definition

CREATE TABLE IF NOT EXISTS carpool_map (
  cm_id SERIAL PRIMARY KEY,
  carpool_id INT NOT NULL,
  user_id INT NOT NULL,
  order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_cancel VARCHAR(255),
  CONSTRAINT carpool_map_fk_user_id FOREIGN KEY (user_id) REFERENCES hov_user (user_id),
  CONSTRAINT carpool_map_ibfk_1 FOREIGN KEY (carpool_id) REFERENCES carpool (id)
);

-- hov.user_role_map definition

CREATE TABLE IF NOT EXISTS user_role_map (
  urm_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES role (id),
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES hov_user (user_id)
);


-- init data

INSERT INTO hov_user (user_id, name, email, password) VALUES(4, 'tom', 'aaa', 'aaa');
INSERT INTO hov_user (user_id, name, email, password) VALUES(5, 'peter', 'bbb', 'bbb');
INSERT INTO hov_user (user_id, name, email, password) VALUES(8, 'sss', 'sedoh', 'sss');
INSERT INTO hov_user (user_id, name, email, password) VALUES(9, 'sss', 'test11', 'sss');
INSERT INTO hov_user (user_id, name, email, password) VALUES(10, 'qqq', 'john.doe@example.com', 'qqq');
INSERT INTO hov_user (user_id, name, email, password) VALUES(11, 'tomy', 'tony@example.com', '111');
INSERT INTO hov_user (user_id, name, email, password) VALUES(12, '040', 'tomato@example.com', 'tomato040');
INSERT INTO hov_user (user_id, name, email, password) VALUES(13, '040', 'potato@example.com', 'tomato040');
INSERT INTO hov_user (user_id, name, email, password) VALUES(14, 'TPI', 'TPI@example.com', '666');
INSERT INTO hov_user (user_id, name, email, password) VALUES(15, 'TPI', 'TPallstart@example.com', '666');
INSERT INTO hov_user (user_id, name, email, password) VALUES(16, 'TPI', 'llstart@example.com', '666');
INSERT INTO hov_user (user_id, name, email, password) VALUES(17, 'TPI', 'start@example.com', '666');



INSERT INTO role (id, role_name, role_name_chinese) VALUES(100, 'Passenger', '乘客');
INSERT INTO role (id, role_name, role_name_chinese) VALUES(200, 'Driver', '司機');
INSERT INTO role (id, role_name, role_name_chinese) VALUES(900, 'Admin', '管理員');


INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(4, 10, 100);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(5, 11, 100);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(6, 9, 100);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(11, 10, 200);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(12, 12, 100);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(13, 12, 200);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(14, 9, 200);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(15, 13, 100);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(16, 14, 100);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(17, 15, 100);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(18, 15, 200);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(19, 16, 100);
INSERT INTO user_role_map (urm_id, user_id, role_id) VALUES(20, 17, 100);


INSERT INTO carpool (id, driver_Id, launch_time, site, destination, pick_AMT, order_AMT, is_cancel, create_time) VALUES(1, 4, '2024-11-18 08:00:00', 'Taipei', 'Hsinchu', 3, 0, 'N', '');
INSERT INTO carpool (id, driver_Id, launch_time, site, destination, pick_AMT, order_AMT, is_cancel, create_time) VALUES(2, 5, '2024-11-18 09:30:00', 'Hsinchu', 'Taichung', 2, 0, 'N', '');
INSERT INTO carpool (id, driver_Id, launch_time, site, destination, pick_AMT, order_AMT, is_cancel, create_time) VALUES(3, 5, '2024-11-18 11:00:00', 'Taichung', 'Kaohsiung', 1, 0, 'N', '');
INSERT INTO carpool (id, driver_Id, launch_time, site, destination, pick_AMT, order_AMT, is_cancel, create_time) VALUES(4, 5, '2024-11-18 14:00:00', 'Taipei', 'Kaohsiung', 5, 0, 'Y', '');
INSERT INTO carpool (id, driver_Id, launch_time, site, destination, pick_AMT, order_AMT, is_cancel, create_time) VALUES(5, 4, '2024-11-18 16:30:00', 'Kaohsiung', 'Tainan', 4, 0, 'N', '');
INSERT INTO carpool (id, driver_Id, launch_time, site, destination, pick_AMT, order_AMT, is_cancel, create_time) VALUES(12, 11, '2024-11-30 08:00:00', 'Hualan', 'Ilan', 3, 0, 'N', '2024-11-28 16:12:30');
INSERT INTO carpool (id, driver_Id, launch_time, site, destination, pick_AMT, order_AMT, is_cancel, create_time) VALUES(13, 12, '2024-12-06 12:30:00', 'Taipei', 'Taoyun', 2, 1, 'N', '2024-11-29 22:35:45');
INSERT INTO carpool (id, driver_Id, launch_time, site, destination, pick_AMT, order_AMT, is_cancel, create_time) VALUES(14, 15, '2024-12-06 12:30:00', 'Taipei', 'Taichuang', 5, 0, 'Y', '2024-12-03 15:08:00');


INSERT INTO carpool_map (cm_Id, carpool_id, user_id, order_time, is_cancel) VALUES(78, 14, 14, '2024-12-04 11:09:53', 'Y');
INSERT INTO carpool_map (cm_Id, carpool_id, user_id, order_time, is_cancel) VALUES(79, 14, 14, '2024-12-04 19:28:19', 'Y');
INSERT INTO carpool_map (cm_Id, carpool_id, user_id, order_time, is_cancel) VALUES(80, 14, 14, '2024-12-04 20:00:17', 'Y');
INSERT INTO carpool_map (cm_Id, carpool_id, user_id, order_time, is_cancel) VALUES(81, 14, 13, '2024-12-04 20:00:29', 'Y');
INSERT INTO carpool_map (cm_Id, carpool_id, user_id, order_time, is_cancel) VALUES(82, 14, 17, '2024-12-07 15:39:14', 'Y');
INSERT INTO carpool_map (cm_Id, carpool_id, user_id, order_time, is_cancel) VALUES(83, 13, 14, '2024-12-08 14:19:25', 'N');



INSERT INTO approve_todo_list (atl_id, user_id, role_id, msg, apply_time, is_approve) VALUES(10, 9, 200, '申請成為司機', '2024-11-27 15:59:20', 'Y');
INSERT INTO approve_todo_list (atl_id, user_id, role_id, msg, apply_time, is_approve) VALUES(11, 10, 200, '申請成為司機', '2024-11-27 15:59:28', 'Y');
INSERT INTO approve_todo_list (atl_id, user_id, role_id, msg, apply_time, is_approve) VALUES(12, 10, 200, '申請成為司機', '2024-11-29 16:59:49', 'TBD');
INSERT INTO approve_todo_list (atl_id, user_id, role_id, msg, apply_time, is_approve) VALUES(13, 12, 200, '申請成為司機', '2024-11-29 22:32:18', 'Y');
INSERT INTO approve_todo_list (atl_id, user_id, role_id, msg, apply_time, is_approve) VALUES(14, 9, 200, '申請成為司機', '2024-12-02 15:06:45', 'Y');
INSERT INTO approve_todo_list (atl_id, user_id, role_id, msg, apply_time, is_approve) VALUES(15, 15, 200, '申請成為司機', '2024-12-03 14:53:40', 'TBD');
INSERT INTO approve_todo_list (atl_id, user_id, role_id, msg, apply_time, is_approve) VALUES(16, 15, 200, '申請成為司機', '2024-12-03 14:53:58', 'Y');
INSERT INTO approve_todo_list (atl_id, user_id, role_id, msg, apply_time, is_approve) VALUES(21, 14, 200, '申請成為司機', '2024-12-07 15:37:36', 'TBD');
INSERT INTO approve_todo_list (atl_id, user_id, role_id, msg, apply_time, is_approve) VALUES(23, 17, 200, '申請成為司機', '2024-12-07 15:51:49', 'TBD');



