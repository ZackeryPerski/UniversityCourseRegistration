from random_address import real_random_address
import names, random

f = open("testDataInsert.sql","w")
emailEnders = ["@gmail.com","@outlook.com","@hotmail.com","@yahoo.com","@protonmail.com","@msn.com"]

#Hard coded status inserts
statusInsert = "insert into status(status_type) values ('pending'),('approved'),('denied');"


usersInsert = "insert into users (address, email, first_name, last_name, user_password, user_name) values ('{address}','{email}','{first_name}','{last_name}','{user_password}','{user_name}');"
accountsInsert = "insert into accounts(amount,account_type_id,user_id) values ({amount:.2f},{account_type_id},{user_id});"

#boilerplate entries to clear the db for demo.
f.write("delete from status cascade;\n")
f.write("delete from account_type cascade;\n")
f.write("delete from transaction_types cascade;\n")
f.write("delete from users;\n")
f.write("\n\n")
#boilerplate entries to initialize helper tables.
f.write("insert into status(status_type) values ('pending'),('approved'),('denied');\n")
f.write("insert into account_type(account_type_name) values ('checking'),('savings');\n")
f.write("insert into transaction_types(transaction_types_name) values ('expense'),('income');\n\n\n")

i = 0
while i<50:
   output = usersInsert
   accountSQL = accountsInsert
   fName = names.get_first_name()
   lName = names.get_last_name()
   emailTemp = fName+"."+lName+str(random.randint(1,9999))+random.choice(emailEnders)
   userPasswordTemp = str(random.choice(random.choice(emailEnders)))+str(random.randrange(0,100))+str(random.choice(random.choice(emailEnders)))+random.choice(['!',"_","@","#","$","^","&","*","(",")","-","=","+"])
   userNameTemp = random.choice([fName,lName])+str(random.randint(1,9999))
   addressDictionary = real_random_address()
   addressTemp = addressDictionary['address1']+", "+addressDictionary['city']+', '+addressDictionary['state']+', ' + addressDictionary['postalCode']
   output = output.format(address=addressTemp,email=emailTemp,first_name=fName,last_name=lName,user_password=userPasswordTemp,user_name=userNameTemp)
   
   accountSQL = accountSQL.format(amount=random.random()*1000,account_type_id=random.randint(1,2),user_id=i+1)
   if random.randint(0,1)==1:
      accountSQL = accountSQL + "\n"+accountsInsert.format(amount=random.random()*1000,account_type_id=random.randint(1,2),user_id=i+1)
   f.write(output+"\n")
   f.write(accountSQL+"\n")
   i+=1

f.close()