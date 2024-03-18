delete from status cascade;image.png
delete from account_type cascade;
delete from transaction_types cascade;
delete from users;


insert into status(status_type) values ('pending'),('approved'),('denied');
insert into account_type(account_type_name) values ('checking'),('savings');
insert into transaction_types(transaction_types_name) values ('expense'),('income');


insert into users (address, email, first_name, last_name, user_password, user_name) values ('2703 Woolsey Street, Berkeley, CA, 94705','Nina.Jones7151@protonmail.com','Nina','Jones','t13o)','Jones535');
insert into accounts(amount,account_type_id,user_id) values (763.36,1,35);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('6233 South Hampton Drive, Montgomery, AL, 36116','Juana.Garcia3374@outlook.com','Juana','Garcia','m11.@','Juana6509');
insert into accounts(amount,account_type_id,user_id) values (277.73,2,36);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('1841 Logan Street, Anchorage, AK, 99508','Stephanie.Sullivan6604@hotmail.com','Stephanie','Sullivan','h8c(','Stephanie7221');
insert into accounts(amount,account_type_id,user_id) values (781.25,1,37);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('1915 Dean Forest Road, Pooler, GA, 31322','Marcellus.Vaughn5597@msn.com','Marcellus','Vaughn','m53r!','Vaughn1354');
insert into accounts(amount,account_type_id,user_id) values (305.66,2,38);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('3521 Stargate Circle, Anchorage, AK, 99517','Alina.Barraza2052@msn.com','Alina','Barraza','m56g^','Alina6546');
insert into accounts(amount,account_type_id,user_id) values (547.72,2,39);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('1 Tanaquay Court, Savannah, GA, 31411','Thomas.Ritter8953@msn.com','Thomas','Ritter','c73a-','Ritter881');
insert into accounts(amount,account_type_id,user_id) values (422.58,2,40);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('1417 Stoneykirk Road, Pelham, AL, 35124','Reba.Magee107@yahoo.com','Reba','Magee','m78o)','Magee1135');
insert into accounts(amount,account_type_id,user_id) values (874.22,1,41);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('208 Towne Lake Way, Pooler, GA, 31322','Nathan.Evans4615@msn.com','Nathan','Evans','l6h(','Nathan349');
insert into accounts(amount,account_type_id,user_id) values (774.12,2,42);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('5601 West Missouri Avenue, Glendale, AZ, 85301','Stuart.Spencer5051@protonmail.com','Stuart','Spencer','c89i@','Spencer8142');
insert into accounts(amount,account_type_id,user_id) values (54.45,2,43);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('521 East 4th Street, Panama City, FL, 32401','Raquel.Auer1326@outlook.com','Raquel','Auer','u0m*','Auer2175');
insert into accounts(amount,account_type_id,user_id) values (939.32,2,44);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('2806 Bass Street, Anchorage, AK, 99507','Sammy.Stcharles7679@hotmail.com','Sammy','Stcharles','@65o@','Stcharles7268');
insert into accounts(amount,account_type_id,user_id) values (844.40,2,45);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('37 East Broad Street, Savannah, GA, 31401','Linda.Karow43@hotmail.com','Linda','Karow','m62n!','Linda1853');
insert into accounts(amount,account_type_id,user_id) values (239.86,2,46);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('6702 Johnny Mercer Boulevard, Savannah, GA, 31410','Robin.Rehling4835@protonmail.com','Robin','Rehling','n38c@','Robin4392');
insert into accounts(amount,account_type_id,user_id) values (70.84,2,47);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('307 Joel Street, Pooler, GA, 31322','Brandi.Whitfield2959@gmail.com','Brandi','Whitfield','h27l#','Brandi2644');
insert into accounts(amount,account_type_id,user_id) values (109.92,1,48);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('3301 Old Muldoon Road, Anchorage, AK, 99504','Fred.Taylor4934@outlook.com','Fred','Taylor','l83t(','Fred6265');
insert into accounts(amount,account_type_id,user_id) values (386.32,2,49);
insert into users (address, email, first_name, last_name, user_password, user_name) values ('1514 Wyoming Avenue, Lynn Haven, FL, 32444','Edna.Saucier9466@outlook.com','Edna','Saucier','k39r!','Edna7546');
insert into accounts(amount,account_type_id,user_id) values (999.49,2,50);
